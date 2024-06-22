import threading

def start_thread():
  t = threading.Thread(target=id, args=[0])
  t.start()
  return t

for i in range(10000):
  threads = [start_thread() for j in range(32)]
  for t in threads:
    t.join()
