class CustomError extends Error
{
    constructor(message,statuscode)
    {
        super(message);
        this.statuscode = statuscode;
        this.isOpration = true;
    }
}

module.exports = CustomError;