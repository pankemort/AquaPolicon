import express from "express";
import { Users } from "../models/user.js";
import { getMyprofile, getallusers, getdatabyid, login, register } from "../controllers/user.js";

const router = express.Router();

router.get('/all' ,getallusers);
 
 router.get('/userid' ,getdatabyid);

router.post('/new' , register);
 router.post('/login' , login);
 router.get('/me', getMyprofile);
 router.get('/' , (req,res) =>{
    res.send("nice wokring")
})


 export default router;