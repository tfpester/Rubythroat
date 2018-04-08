///RubeHorizontalaMovement(aCurrentSpeed, aMove, aMovementSpeed, aSpeedSoftCap, aSpeedHardCap, aFriction)
{
	var aCurrentSpeed = argument0;
	var aMove = argument1;
	var aMovementSpeed = argument2;
	var aSpeedSoftCap = argument3;
	var aSpeedHardCap = argument4;
	var aFriction = argument5;

	var pastRightSoftCap = (aCurrentSpeed >= aSpeedSoftCap * global.delta);
	var pastLeftSoftCap = (aCurrentSpeed <= -aSpeedSoftCap * global.delta);
	
	// Add friction if past softcap
	// Friction added relative to anlogue movement, set friction to 1 if past cap
	var frictionMultiplier = 1 - abs(aMove);
    if(pastLeftSoftCap || pastRightSoftCap)
		frictionMultiplier = 1;
	
	var frictionForce = 0;
	var speedAfterFriction = 0;
    if(aCurrentSpeed > 0) {
        frictionForce = frictionMultiplier * aFriction * global.deltaSq;
		aCurrentSpeed = max(aCurrentSpeed - frictionForce, 0);
    }
    else {
        frictionForce = frictionMultiplier * aFriction * global.deltaSq;
        aCurrentSpeed = min(aCurrentSpeed + frictionForce, 0);
    } 
	
	// Now it's time to allow user to add movement speed
    // Only allow extra speed if below softcap and make sure it never adds more than the softcap
	var movementForce = aMove * aMovementSpeed * global.deltaSq;
    
	if(movementForce > 0 && !pastRightSoftCap)
		aCurrentSpeed = min(aCurrentSpeed + movementForce, aSpeedSoftCap * global.delta);
	else if (movementForce < 0 && !pastLeftSoftCap)
		aCurrentSpeed = max(aCurrentSpeed + movementForce, -aSpeedSoftCap * global.delta);
		
    // Hardcap speed so speed is NEVER above the hardcap
    aCurrentSpeed = clamp(aCurrentSpeed, -aSpeedHardCap * global.delta, aSpeedHardCap * global.delta);
	
	return aCurrentSpeed;
}