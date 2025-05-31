function room = initRoom()
    room = ones(20, 20);
    room(5:6, 10:13) = -1;
    room(15, 3:7) = -1;
    room(10:11, 17:18) = -1;
    room(8:12, 8:9) = -1;
    room(2:3, 15:16) = -1;
end

