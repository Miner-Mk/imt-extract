#!/bin/bash

TITLE_LINE_TOP=300
TITLE_LINE_HEIGHT=55
BOX1_LINE_TOP=658
BOX1_LINE_HEIGHT=28
COST_LINE_TOP=1426
COST_LINE_HEIGHT=41

# The pixel column where the green button starts (overlaps the letters)
COST_GREEN_COL=530

function cost_end_extract() {
    IMAGE="$1"
    OUTPUT_FILENAME="$2"
    WIDTH="$3"
    convert "${IMAGE}" -crop ${WIDTH}x${COST_LINE_HEIGHT}+$((530-${WIDTH}))+${COST_LINE_TOP} ${OUTPUT_FILENAME}
}

function box1_extract() {
    IMAGE="$1"
    OUTPUT_FILENAME="$2"
    WIDTH="$3"
    START="$4"
    convert "${IMAGE}" -crop ${WIDTH}x${BOX1_LINE_HEIGHT}+${START}+${BOX1_LINE_TOP} ${OUTPUT_FILENAME}
}

# Yellow
box1_extract "00000127.png" box_l.png  7 696
box1_extract "00000205.png" box_m.png 23 679
box1_extract "00000302.png" box_n.png 15 687
box1_extract "00000366.png" box_o.png 15 687
box1_extract "00000454.png" box_p.png 16 687
box1_extract "00000486.png" box_q.png 16 686
box1_extract "00000547.png" box_r.png 12 691
box1_extract "00000639.png" box_t.png 10 693
box1_extract "00000736.png" box_u.png 15 687
box1_extract "00000764.png" box_v.png 16 687
box1_extract "00000789.png" box_w.png 25 678
box1_extract "00000855.png" box_x.png 15 687
box1_extract "00000931.png" box_y.png 15 688
box1_extract "00000993.png" box_z.png 14 689

# White
box1_extract "82.2ac:s.png" box_c.png 12 691
box1_extract "1.07ad:s.png" box_d.png 15 687
box1_extract "00000772.png" box_e.png 15 688
box1_extract "00000817.png" box_f.png  9 694
box1_extract "00000914.png" box_g.png 16 686
box1_extract "00001007.png" box_h.png 14 688
box1_extract "00001073.png" box_i.png  8 695
box1_extract "00001168.png" box_j.png  7 696
box1_extract "00001227.png" box_k.png 15 688
box1_extract "395:s.png"    box_s.png  9 720

cost_end_extract "00000001.png" cost_end_0.png 17 
cost_end_extract "00000708.png" cost_end_1.png 8  
cost_end_extract "00000044.png" cost_end_2.png 17 
cost_end_extract "00000719.png" cost_end_4.png 16 
cost_end_extract "00000713.png" cost_end_5.png 15 
cost_end_extract "00000055.png" cost_end_6.png 16 
cost_end_extract "395:s.png"    cost_end_8.png 17 
cost_end_extract "00000489.png" cost_end_a.png 17 
cost_end_extract "00000607.png" cost_end_b.png 16 
cost_end_extract "00000818.png" cost_end_c.png 11 
cost_end_extract "00000849.png" cost_end_d.png 17 
cost_end_extract "00000817.png" cost_end_e.png 14 
cost_end_extract "00000866.png" cost_end_f.png 8  
cost_end_extract "00000928.png" cost_end_g.png 16 
cost_end_extract "00001007.png" cost_end_h.png 15 
cost_end_extract "00001073.png" cost_end_i.png 5  
cost_end_extract "00001168.png" cost_end_j.png 7  
cost_end_extract "00000030.png" cost_end_k.png 14 
cost_end_extract "00000127.png" cost_end_l.png 6  
cost_end_extract "00000205.png" cost_end_m.png 25 
cost_end_extract "00000302.png" cost_end_n.png 15 
cost_end_extract "00000366.png" cost_end_o.png 16 
cost_end_extract "00000415.png" cost_end_p.png 16 
cost_end_extract "00000486.png" cost_end_q.png 16 
cost_end_extract "00000547.png" cost_end_r.png 10 
cost_end_extract "00000613.png" cost_end_s.png 10 
cost_end_extract "00000639.png" cost_end_t.png 8  
cost_end_extract "00000678.png" cost_end_u.png 15 
cost_end_extract "00000736.png" cost_end_v.png 15 
cost_end_extract "00000789.png" cost_end_w.png 25 
cost_end_extract "00000855.png" cost_end_x.png 15 
cost_end_extract "00000894.png" cost_end_y.png 15 
cost_end_extract "00000993.png" cost_end_z.png 13 
cost_end_extract "1.04M:s.png"  cost_end_upper_k.png 19 
cost_end_extract "2.76B:s.png"  cost_end_upper_m.png 25 
cost_end_extract "00000224.png" cost_end_upper_b.png 16 
cost_end_extract "00000430.png" cost_end_upper_t.png 15 

IMAGE="00000038.png"
convert "${IMAGE}" -crop 20x${COST_LINE_HEIGHT}+454+${COST_LINE_TOP} cost_0.png

IMAGE="00000846.png"
convert "${IMAGE}" -crop 18x${COST_LINE_HEIGHT}+474+${COST_LINE_TOP} cost_9.png

IMAGE="00000849.png" 
convert "${IMAGE}" -crop 19x${COST_LINE_HEIGHT}+453+${COST_LINE_TOP} cost_2.png
convert "${IMAGE}" -crop 21x${COST_LINE_HEIGHT}+472+${COST_LINE_TOP} cost_4.png
convert "${IMAGE}" -crop 18x${COST_LINE_HEIGHT}+494+${COST_LINE_TOP} cost_a.png
convert "${IMAGE}" -crop 8x${COST_LINE_HEIGHT}+442+${COST_LINE_TOP} cost_dot.png

IMAGE="00000818.png" 
convert "${IMAGE}" -crop 17x${COST_LINE_HEIGHT}+440+${COST_LINE_TOP} cost_3.png
convert "${IMAGE}" -crop 18x${COST_LINE_HEIGHT}+479+${COST_LINE_TOP} cost_8.png

IMAGE="00000607.png" 
convert "${IMAGE}" -crop 17x${COST_LINE_HEIGHT}+455+${COST_LINE_TOP} cost_5.png
convert "${IMAGE}" -crop 18x${COST_LINE_HEIGHT}+474+${COST_LINE_TOP} cost_6.png

IMAGE="00000430.png" 
convert "${IMAGE}" -crop 10x${COST_LINE_HEIGHT}+462+${COST_LINE_TOP} cost_1.png
convert "${IMAGE}" -crop 18x${COST_LINE_HEIGHT}+475+${COST_LINE_TOP} cost_7.png

IMAGE="1.07ad:s.png" 
convert "${IMAGE}" -crop 25x${TITLE_LINE_HEIGHT}+390+${TITLE_LINE_TOP} title_5.png
convert "${IMAGE}" -crop 27x${TITLE_LINE_HEIGHT}+563+${TITLE_LINE_TOP} title_7.png
convert "${IMAGE}" -crop 27x${TITLE_LINE_HEIGHT}+621+${TITLE_LINE_TOP} title_9.png

IMAGE="25.7K:s.png" 
convert "${IMAGE}" -crop 192x${TITLE_LINE_HEIGHT}+200+${TITLE_LINE_TOP} title_el.png

IMAGE="395:s.png" 
convert "${IMAGE}" -crop 248x${TITLE_LINE_HEIGHT}+150+${TITLE_LINE_TOP} title_ms.png
convert "${IMAGE}" -crop 13x${BOX1_LINE_HEIGHT}+656+${BOX1_LINE_TOP} box_3.png
convert "${IMAGE}" -crop 13x${BOX1_LINE_HEIGHT}+689+${BOX1_LINE_TOP} box_5.png
convert "${IMAGE}" -crop 14x${BOX1_LINE_HEIGHT}+672+${BOX1_LINE_TOP} box_9.png
convert "${IMAGE}" -crop 11x${BOX1_LINE_HEIGHT}+705+${BOX1_LINE_TOP} box_slash.png

IMAGE="2.18K:s.png" 
convert "${IMAGE}" -crop 14x${BOX1_LINE_HEIGHT}+632+${BOX1_LINE_TOP} box_2.png
convert "${IMAGE}" -crop 7x${BOX1_LINE_HEIGHT}+649+${BOX1_LINE_TOP} box_dot.png
convert "${IMAGE}" -crop 9x${BOX1_LINE_HEIGHT}+657+${BOX1_LINE_TOP} box_1.png
convert "${IMAGE}" -crop 16x${BOX1_LINE_HEIGHT}+667+${BOX1_LINE_TOP} box_8.png
convert "${IMAGE}" -crop 17x${BOX1_LINE_HEIGHT}+685+${BOX1_LINE_TOP} box_upper_k.png

IMAGE="1.04M:s.png" 
convert "${IMAGE}" -crop 17x${TITLE_LINE_HEIGHT}+391+${TITLE_LINE_TOP} title_1.png
convert "${IMAGE}" -crop 31x${TITLE_LINE_HEIGHT}+553+${TITLE_LINE_TOP} title_2.png
convert "${IMAGE}" -crop 30x${TITLE_LINE_HEIGHT}+586+${TITLE_LINE_TOP} title_0.png
convert "${IMAGE}" -crop 27x${TITLE_LINE_HEIGHT}+618+${TITLE_LINE_TOP} title_4.png # Needs to cut off the sides a bit due to overlap. Identified with "04" and "44"
convert "${IMAGE}" -crop 118x${TITLE_LINE_HEIGHT}+421+${TITLE_LINE_TOP} title_level.png
convert "${IMAGE}" -crop 17x${BOX1_LINE_HEIGHT}+646+${BOX1_LINE_TOP} box_0.png
convert "${IMAGE}" -crop 16x${BOX1_LINE_HEIGHT}+663+${BOX1_LINE_TOP} box_4.png
convert "${IMAGE}" -crop 23x${BOX1_LINE_HEIGHT}+680+${BOX1_LINE_TOP} box_upper_m.png

IMAGE="2.76B:s.png" 
convert "${IMAGE}" -crop 16x${BOX1_LINE_HEIGHT}+654+${BOX1_LINE_TOP} box_7.png
convert "${IMAGE}" -crop 16x${BOX1_LINE_HEIGHT}+670+${BOX1_LINE_TOP} box_6.png
convert "${IMAGE}" -crop 14x${BOX1_LINE_HEIGHT}+688+${BOX1_LINE_TOP} box_upper_b.png

IMAGE="1.88T:s.png" 
convert "${IMAGE}" -crop 15x${BOX1_LINE_HEIGHT}+688+${BOX1_LINE_TOP} box_upper_t.png

IMAGE="1.47ab:s.png" 
convert "${IMAGE}" -crop 14x${BOX1_LINE_HEIGHT}+671+${BOX1_LINE_TOP} box_a.png
convert "${IMAGE}" -crop 15x${BOX1_LINE_HEIGHT}+687+${BOX1_LINE_TOP} box_b.png

mv title_{ms,el,level,0,1,2,4,5,7,9}.png ..
mv box_{0,1,2,3,4,5,6,7,8,9,upper_k,upper_m,upper_b,upper_t,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,dot,slash}.png ..
mv cost_{0,1,2,3,4,5,6,7,8,9,a,dot}.png ..
mv cost_end_{0,1,2,4,5,6,8,upper_k,upper_b,upper_m,upper_t,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}.png ..
