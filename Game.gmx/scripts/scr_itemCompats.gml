TargetPlatform = argument0; // website
theme = argument1;
slider1 = argument2
slider2 = argument3;
slider3 = argument4;
name = argument5;
currentFans = argument6;

//Device Scores

if (TargetPlatform == "Website"){

    if (theme == "Intranet"){
        slider1Min = 25;
        slider2Min = 25;
        slider3Min = 50;
    }
}


// checking for score


//If null data throw exception back
if (slider1Min == null) or (slider2Min == null) or (slider3Min == null){return "ERROR"}

//Add penalty total together
repeatCount = 0;
penalty = 0;
repeat (3) {repeatCount = repeatCount + 1;
if (repeatCount == 1){sliderVal = slider1; sliderMin = slider1Min}
if (repeatCount == 2){sliderVal = slider2; sliderMin = slider2Min}
if (repeatCount == 3){sliderVal = slider3; sliderMin = slider3Min}
if (sliderVal < sliderMin) {
    diff = slider1Min - slider1;
    percent25 = sliderMin * 0.25;
    percent50 = sliderMin * 0.5;
    percent75 = sliderMin * 0.75;
    if (diff < percent25){penalty = penalty + 10 + round(random(3))}
    if (diff < percent50) and (diff > percent25){penalty = penalty + 15 + round(random(3))}
    if (diff < percent75) and (diff > percent50){penalty = penalty + 17.5 + round(random(3))}
    }
}
//add random Penalty
if (penalty >= 15){
    penaltyRandomFunc = random(2);
    penaltyRandomVal = random(15)
    if (penaltyRandomFunc <= 1){penalty = penalty + penaltyRandomVal}
    else {penalty = penalty - penaltyRandomVal}
}
penalty = penalty / 100

//cash & fans calc

if (currentFans < 500){
    newFans = 35 + random(50)
}    
else {randomFanMultiplyer = random(18)
    while (randomFanMultiplyer <=8){
    randomFanMultiplyer = randomFanMultiplyer * 1.5
    }
    newFans = currentFans / randomFansMultiplyer
    newfans = round(newfans)
} 

totalAffectFans = newFans + currentFans + random(2000)

cash = round(random(35)) * totalAffectFans

cash = cash * penalty

// create return array

//var s_array[rw*rh] = 0;

//for(var i=0;i<rw;i+=g)
//{
//     for(var j=0;j<rh;j+=g)
//    {
//         s_array[ i+j ] = new_grid[# i, j]
//    }
//}

//return s_array
