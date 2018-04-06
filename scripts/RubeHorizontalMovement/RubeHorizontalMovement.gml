///RubeHorizontalaMovement(aCurrentSpeed, aMove, aMovementSpeed, aSpeedSoftCap, aSpeedHardCap, aFriction)
{
	var aCurrentSpeed = argument0;
	var aMove = argument1;
	var aMovementSpeed = argument2;
	var aSpeedSoftCap = argument3;
	var aSpeedHardCap = argument4;
	var aFriction = argument5;

	
    // Softcap it here so speed is not faster than softcap
    if(aMove != 0 && 
		!((aMove > 0 && aCurrentSpeed >= aSpeedSoftCap * global.delta) 
		|| aMove < 0 && aCurrentSpeed <= -aSpeedSoftCap * global.delta)) 
	{
        // Add speed
        aCurrentSpeed += aMove * aMovementSpeed * global.delta;
    }
    
    // Add friction relative to anlogue movement
    var frictionToAdd = 1 - abs(aMove);
    if(aCurrentSpeed > 0) {
        aCurrentSpeed -= frictionToAdd * aFriction * global.delta;
        aCurrentSpeed = max(aCurrentSpeed, 0);
    }
    else {
        aCurrentSpeed += frictionToAdd * aFriction * global.delta;
        aCurrentSpeed = min(aCurrentSpeed, 0);
    }    
    
    // Softcap speed
    if(aCurrentSpeed > aSpeedSoftCap) {
        aCurrentSpeed = max(aCurrentSpeed - (aFriction * global.delta), aSpeedSoftCap * global.delta); 
    }
    else if(aCurrentSpeed < -aSpeedSoftCap) {
        aCurrentSpeed = min(aCurrentSpeed + (aFriction * global.delta), -aSpeedSoftCap * global.delta);
    }

    // Hardcap speed
    aCurrentSpeed = clamp(aCurrentSpeed, -aSpeedHardCap * global.delta, aSpeedHardCap * global.delta);
	
	return aCurrentSpeed;
}