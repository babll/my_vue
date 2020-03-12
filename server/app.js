//功能:服务器程序
//1:引入四个模块
const express = require("express"); //web服务器模块
const mysql = require("mysql");//mysql模块
const session = require("express-session");//session模块
const cors = require("cors");//跨域
//2:创建连接池
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    database:"sc",
    port:3306,
    connectionLimit:15
})
//3:创建web服务器
var server = express();
//4:配置跨域模块
//4.1:允许程序列表 脚手架
//4.2:每次请求验证
server.use(cors({
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true 
}))
//5:指定静态资源目录 public
server.use(express.static("public"));
//6:配置session对象 !!!
server.use(session({
    secret:"128位安全字符串",//加密条件
    resave:true,
    saveUninitialized:true
}));
//7:为服务器绑定监听端口 4000
server.listen(4000);

//功能一:用户登录验证
server.get("/login",(req,res)=>{
    var $uname=req.query.uname;
    var $upwd=req.query.upwd;
    var sql="SELECT uid FROM sc_user WHERE uname=? AND upwd=?";
    pool.query(sql,[$uname,$upwd],(err,result)=>{
        if(err)throw err;
        // console.log(result)
        if(result.length==0){
            res.send({code:-1,msg:"用户名或者密码有误"});
        }else{
            req.session.uid = result[0].id;
            res.send({code:1,msg:"登陆成功"});
            
        }
    }) 
})

server.get('/reg',(req,res)=>{
    var uname = req.query.uname;
    var upwd = req.query.upwd;
    // console.log(uname+upwd)
    pool.query('INSERT INTO sc_user VALUES(null,?,?)',[uname,upwd],(err,result)=>{
      if(err) throw err;
    //   console.log(result);
      //如果数据插入成功，响应对象
      if(result.affectedRows>0){
        res.send({code:200,msg:'register suc'});
        //res.redirect('/login');
      }
    });
  });

// 功能二 ：显示商品列表
server.get("/product",(req,res)=>{
    var sql="SELECT * FROM sc_index_product";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

server.get("/list",(req,res)=>{
	var id = req.query.id;
    var sql="SELECT * FROM sc_list WHERE family_id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

server.get("/details",(req,res)=>{
	var did = req.query.did;
    var sql="SELECT * FROM sc_particulars WHERE pid=?";
    pool.query(sql,[did],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

// 功能三：将商品添加至购物车
server.get("/addcart",(req,res)=>{
    // 1.获取当前登录用户凭证
    var uid = req.session.uid;
    // 2.如果当前用户没有登录凭证，输出请登录
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    // 3.获取脚手架传递数据 lid，lname，price
    var lid = req.query.lid;
    var lname = req.query.lname;
    var price = req.query.price;
    // 4.创建sql语句 查询当前用户是否买过此商品
    var sql = "SELECT id FROM xz_cart WHERE uid=? AND lid=?"
    // 5.执行sql语句
    // console.log(1)
    pool.query(sql,[uid,lid],(err,result)=>{
        // 6.在回调函数（钩子函数）
        // console.log(2)
        if(err) throw err;
        // 7.获取查询结果[判断是否购买过此商品]
        if(result.length==0){
            // 8.如果没有买过此商品 创建INSERT SQL
        //    console.log(3)
           var sql = `INSERT INTO xz_cart VALUES(null,${lid},'${lname}',${price},1,${uid})`;
        }else{
            // 9.如果已买过此商品 创建UPDATE SQL
            var sql = `UPDATE xz_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
        }
        // 10.执行sql
        // 11.返回结果 
        pool.query(sql,(err,result)=>{
            if(err)throw err;
            res.send({code:1,msg:"添加成功"})
        })
    })
})

// 功能四:查询指定用户购物车列表
server.get("/findcart",(req,res)=>{
    var uid = req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请登录"});
    }
    var sql = "SELECT id,lid,lname,price,count FROM xz_cart WHERE uid=?"
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        res.send({coed:1,msg:"查询成功",data:result});
    })
});

// 功能五：删除购物车中商品
server.get("/del",(req,res)=>{
    var uid = req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请登录"});
    };
    var id = req.query.id;
    var sql = "DELETE FROM xz_cart WHERE id=? AND uid=?";
    pool.query(sql,[id,uid],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({coed:1,msg:"删除成功"});
        }else{
            res.send({coed:-1,msg:"删除失败"});
        }
    })
})

// 功能六：删除用户指定商品
server.get("/delm",(req,res)=>{
    var uid = req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    var id = req.query.id;
    var sql = `DELETE FROM xz_cart WHERE id IN(${id})`;
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({coed:1,msg:"删除成功"});
        }else{
            res.send({coed:-1,msg:"删除失败"});
        }
    })
})