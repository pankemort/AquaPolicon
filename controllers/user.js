import { Users } from "../models/user.js"
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const getallusers = async (req,res) =>{

    const users =  await Users.find({})
 
     res.json({
         success:true,
         users,  
     })
 }
export const login = async(req,res,next) =>{



}



export const register = async (req,res) =>{
    const {name, email, password} = req.body;


    let users =  await Users.findOne({email});
    if(users) {
    return res.status(405).json({
        success:false,
        message:"User already exists",
    })}
    const hashedpassword = bcrypt.hash(password,10);

    users = await Users.create({name, email, password:hashedpassword})
    const token = jwt.sign({_id:users._id}, process.env.JWT_SECRET);

    res.status(201).cookie("token" ,token,{
        httpOnly:true,
        maxAge: 15*60*1000,
    }).json({
        success:true,
        message:"registered successfullly",
    })
    
 } 

 export const getdatabyid = async (req,res) =>{
 
    // const {id} = req.query;
    // const users =  await Users.findById(id)
 
    //  res.json({
    //      success:true,
    //      users,  
    //  })
 }