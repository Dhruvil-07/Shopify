const CustomError = require('../utils/ErrorHandler');

const ErrorMiddelware = (err,req,res,next)=>{

    if(!(err.isOpration))
    {
        if(err.code === 11000) 
            err = dubKeyerr(); 
        else if(err.name === "CastError")
            err = casterr();
        else
            err.message =  "Internal Server Error ! Try After Some Time";
            err.statuscode =  500;
    } 
    errresponse(res,err);
}


//dublicate key error function
function dubKeyerr()
{
    let error = new CustomError("Already Register",409);
    return error;
}


//castin error
function casterr()
{
    return new CustomError("Invalid Id",401);
}


//function return err in response
function errresponse(res,err)
{
    return res.status(err.statuscode).json({
        status : "Fail",
        message : err.message,
    });
}


module.exports = ErrorMiddelware;