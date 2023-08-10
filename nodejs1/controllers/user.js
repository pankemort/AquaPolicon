import { Users } from "../models/user.js"
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { sendcookie } from "../utils/features.js";



export const getallusers = async (req,res) =>{

    const users =  await Users.find({})
 
     res.json({
         success:true,
         users,  
     })
 }
export const login = async(req,res,next) =>{

    const {email,password} = req.body;


    let user =  await Users.findOne({email}).select("+password");
    if(!user) {
        return res.status(405).json({
            success:false,
            message:"Invalid Email",
        })}
        const isMatch = await bcrypt.compare(password,user.password);
        if(!isMatch) {
            return res.status(405).json({
                success:false,
                message:"Invalid password",
            })}
            sendcookie(user,res,`welcome back ${user.name}`, 200)

}



export const register = async(req,res) =>{
    
    const {name, email, password} = req.body;


    let user =  await Users.findOne({email});
    if(user) {
    return res.status(405).json({
        success:false,
        message:"User already exists",
    })}
    const hashedpassword = await bcrypt.hash(password,10);

    user = await Users.create({name, email, password:hashedpassword})
    sendcookie(user,res,"registered successfully" , 201)
   
    } 
  

 export const getdatabyid = async (req,res) =>{
 
    // const {id} = req.query;
    // const user =  await Users.findById(id)
 
    //  res.json({
    //      success:true,
    //      users,  
    //  })
 }

 export const getMyprofile = async(req,res) =>{
    const id = "myid";

    const { token } = req.cookies
    // console.log(token);
    if(!token){
        return res.status(404).json({
            success:true,
            message:"Login first",
        })

    }
    const decoded = jwt.verify(token, process.env.JWT_SECRET)
    const user = await Users.findById(decoded._id)
    res.status(200).json({
        success:true,
        user,
    })
 }