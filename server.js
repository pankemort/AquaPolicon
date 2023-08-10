import { app } from "./app.js";
import { dbconnect} from "./data/database.js";


dbconnect(); 


console.log(process.env.PORT)
app.listen(4000, ()=>{
    console.log("server is listening")
})