import string

file = open("inputd20.txt")
lines = file.readlines()

tiles = {}
edges = {}

atile = []
curtile = ""
for i,line in enumerate(lines):
    line = line.strip("\n")

    if ':' in line:
        if curtile:
            tiles[curtile] = atile
            atile = []
        line = line.split(' ')
        curtile = line[1].strip(':')


    else:
        if line:
            atile.append(line)
if curtile:
    tiles[curtile] = atile
    atile = []

for tileid in tiles:
    tile = tiles[tileid]
    edge = []
    edge.append(tile[0])
    edge.append(tile[0][::-1])
    edge.append(tile[-1])
    edge.append(tile[-1][::-1])
    l = []
    r = []
    for row in tile:
        l.append(row[0])
        r.append(row[-1])
    l = "".join(l)
    r = "".join(r)
    edge.append(l)
    edge.append(l[::-1])
    edge.append(r)
    edge.append(r[::-1])
    edges[tileid] = edge

connections = {}
runs = 0
for tile1 in tiles:
    curtile = edges[tile1]
    for edge in curtile:
        for tile2 in tiles:
            if tile2 == tile1:
                continue
            othtile = edges[tile2]
            for edge2 in othtile:
                runs += 1
                if edge == edge2:
                    if tile1 in connections:
                        if tile2 not in connections[tile1]:
                            connections[tile1] += [tile2]
                    else:
                        connections[tile1] = [tile2]

for connect in connections:
    if len(connections[connect]) == 2:
        print(connect, connections[connect])
print(runs)
print(2473*1801*1019*1741 )
# correct 7901522557967