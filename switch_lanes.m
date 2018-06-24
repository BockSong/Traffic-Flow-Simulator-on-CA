function [plaza,v] = switch_lanes(plaza,v)
%换道规则，当车的前面位置被别的车辆占据时，该车考虑换道
%这种车辆在前进规则中状态已经被标记为-2，车辆以prob进行换道
prob = 0.8;
[L,W] = size(plaza);
for i = (L-1):-1:1
        for j = 2:(W-1)
            if plaza(i,j) == -2
                if rand < prob %概率满足，换道
                        if rand>0.5
                        if plaza(i, j+1) == 0 
                            plaza(i,j+1) = 1;
                            plaza(i,j) = 0;
                            v(i,j+1) = v(i,j);
                            v(i,j) = 0;
                        elseif plaza(i, j-1) == 0
                            plaza(i, j-1) = 1;
                            plaza(i,j) = 0;
                            v(i,j-1) = v(i,j);
                            v(i,j) = 0;
                        else
                            plaza(i,j) = 1;
                        end
                    else
                        if plaza(i, j-1) == 0
                            plaza(i, j-1) = 1;
                            plaza(i,j) = 0;
                            v(i,j-1) = v(i,j);
                            v(i,j) = 0;
                        elseif plaza(i, j+1) == 0 
                            plaza(i,j+1) = 1;
                            plaza(i,j) = 0;
                            v(i,j+1) = v(i,j);
                            v(i,j) = 0;
                        else
                            plaza(i,j) = 1;
                        end
                    end
                else
                    plaza(i,j) = 1;
                end
            end
        end
end

for i = (L-1):-1:1
    for j = 2:(W-1)
        if plaza(i,j) == -3 && rand >0.5
                        if plaza(i, j+1) == 0 && j~=W-1
                            plaza(i,j+1) = 1;
                            plaza(i,j) = 0;
                            v(i,j+1) = v(i,j);
                            v(i,j) = 0;
                        else
                            plaza(i,j) = 1;
                        end
        end
    end
end

for i = (L-1):-1:1
        if plaza(i,5) == -4
            if rand < 0.2
                        if plaza(i, 6) == 0
                            plaza(i,6) = 1;
                            plaza(i,5) = 0;
                            v(i,6) = v(i,5);
                            v(i,5) = 0;
                        else
                            plaza(i,5) = 1;
                        end
            else
                plaza(i,5) = 1;
            end
        end
end


for i = (L-1):-1:1
        if plaza(i,6) == -5
            if rand < 0.05
                        if plaza(i, 7) == 0
                            plaza(i,7) = 1;
                            plaza(i,6) = 0;
                            v(i,7) = v(i,6);
                            v(i,6) = 0;
                        else
                            plaza(i,6) = 1;
                        end
            else
                plaza(i,6) = 1;
            end
        end
end