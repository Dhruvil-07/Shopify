// const trycatchHandler = (controller)=>(req,res,next)=>{
//     try
//     {
//         controller(req,res,next);
//     }
//     catch(err)
//     {
//         next(err);
//     }
// }


// const trycatchHandler = (controller)=>{
//     return (req,res,next)=>{
//         try
//         {
//             controller(req,res,next);
//         }
//         catch(err)
//         {
//             console.log(err.code);
//             console.log(err.message);
//             next;
//         }
//     }

//     //Promise.resolve(controller(req,res,next)).catch(next);
// }


const trycatchHandler = (controller) => {
    return (req,res,next)=>
    {
        controller(req,res,next).catch(err=> next(err));
    }
}

module.exports = trycatchHandler;
