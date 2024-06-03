const mongoose = require("mongoose");
const bcrypt = require("bcrypt");

//create user schema
const UserSchema = mongoose.Schema({
    name : {
        type:String,
        require : true,    
    },
    email :
    {
        type:String,
        require:true,
        unique:true,
    },
    password:
    {
        type:String,
        require:true,
    },
    mno:
    {
        type:String,
        require:true,
        unique:true,
    },
    role:
    {
        type:String,
        require:true,
        enum : ['user','admin'],
        default : 'user'
    },
    createAt:
    {
        type:Date,
        default:Date.now(),
    },
    updateAt:
    {
        type:Date,
        default:Date.now(),
    }
});


//create hash of paasword
UserSchema.pre('save',async function(next){
    try
    {
        const salt = await bcrypt.genSalt(10);
        const hashval = await bcrypt.hash(this.password,salt);
        this.password = hashval;
        console.log(this.password , hashval);
    }
    catch(err)
    {
        console.log(err);
    }
});


//password match
UserSchema.method.comparepwd = async function(entredpwd , userpwd)
{
    try
    {
        const isMatch = await bcrypt.compare(userpwd,entredpwd);
        return isMatch;
    }
    catch(err)
    {
        consol.log(err);
    }
}


//user model 
const UserModel = mongoose.model('users',UserSchema);


//export user modul
module.exports = UserModel;