CREATE DEFINER=`root`@`localhost` PROCEDURE `add_patient`(
    pid VARCHAR(20),
    pname VARCHAR(30),
    p_age int,
    paddress  VARCHAR(50),
    doctor_id  VARCHAR(20)
)
BEGIN
    INSERT INTO Patient VALUES (pid, pname, p_age, paddress, doctor_id);
end