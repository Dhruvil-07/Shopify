const ErrorMiddelware = (err,req,res,next)=>{

    err.message = err.message || "Internal Server Error";
    err.statuscode = err.statuscode || 500;

    if(err.code === 11000)
    {
        err.message = "Already available";
        err.statuscode = 409;
    }

    return res.status(err.statuscode).json({
        status : "False",
        msg : err.message,
    });

}

module.exports = {
    ErrorMiddelware,
}