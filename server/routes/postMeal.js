const axios = require('axios');
const schedule = require('node-schedule');

const postRouter = express.Router();

// Make a request for a user with a given ID
axios.get('https://reqres.in/api/users?page=2')
  .then((res)=>{
    console.log(res);
  })
  .catch((err)=>{
    console.log(err);
  });




  //learning tools of axios and node-schedule
  //-----------------------------------------------------

  // schedule.scheduleJob('push-job','* 21 22 * * *',()=>{
//         console.log("yes i am onnn");
//         schedule.cancelJob('push-job');
// })
//##### 2nd Method
// const pushJob = schedule.scheduleJob('* 24 22 * * *',()=>{
//     console.log("yes i am onnn");
//     pushJob.cancel();
// })
//-----------------------------------------------

// axios.get('https://reqres.in/api/users')
// .then((res)=>{
//   console.log(res);
// })
// .catch((err)=>{
//  // console.log(err);
// });