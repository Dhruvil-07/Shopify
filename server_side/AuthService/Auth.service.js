const jwt = require("jsonwebtoken");

//genrate token
async function GenToken(id)
{
    const token = await jwt.sign(id,process.env.SCRETEKEY);
    return token;
}


//verify token
async function VerifyToken(req,res,next)
{
    try
    {
        const authorization = req.headers.authorization;

        if(!authorization)
        {
            return res.status(404).json({status:"fail",message:"Token Not Found"});
        }

        const token = authorization.split(' ')[1];

        const DecodedTokenData = await jwt.verify(token,process.env.SCRETEKEY);

        req.UserId = DecodedTokenData;
        
        next();
    }
    catch(err)
    {
        return res.status(501).json({status:"fail",msg:"Invalid Token"});
    }
}

module.exports = {
    GenToken,
    VerifyToken,
};