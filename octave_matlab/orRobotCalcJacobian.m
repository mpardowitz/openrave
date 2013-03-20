% values = orRobotCalcJacobian(robotid, manipulatorid)
%
% Calculates the jacobian of the manipulator of the robot robotid

function jacobian = orRobotCalcJacobian(robotid, manipulatorid)

   out = orCommunicator(['robot_calcjacobian ' num2str(robotid) ' ' num2str(manipulatorid)], 1);
if(strcmp('error',sscanf(out,'%s',1)))
    error(['Unknown robot id: ' num2str(robotid)]);
end

values = sscanf(out,'%f');
l1 = values(1);
l2 = values(2+l1);
jacobian = [reshape(values(2:(l1+1)), l1/3, 3), reshape(values((l1+3):(l1+l2+2)), l2/4, 4)]; 
