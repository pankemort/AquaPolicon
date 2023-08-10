import express  from "express";
import mongoose from "mongoose";
const app = express();



const UserSchema = mongoose.Schema({
    name: 
    { type:String,
        required:true,
    unique :true,
    },

email:{
    type:String,
    required:true,
unique :true,
},
    password:
    {
        type:String,
        required:true,
    },
    createdAt:{
        type:Date,
        default:Date.now,
    },

});
export const Users = mongoose.model("Users" , UserSchema);

app.listen(4500, () =>{
console.log("server is working")
})