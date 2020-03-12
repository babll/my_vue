<template>
  <div class="login">
    <h2 class="title">Welcome</h2>
    <input type="text" id="uname" placeholder="请输入用户名" v-model="uname">
    <input type="password" id="upwd" placeholder="请输入密码" v-model="upwd">
    <div class="btn">
      <button class="dl" @click="login">登录</button>
      <button class="zc" @click="reg">注册</button>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      uname:"",
      upwd:"",
    }
  },
  methods:{
    reg(){
      this.$router.push("/Reg");
    },
    login(){
      // console.log(this.uname)
      // 创建正则表达式用于验证用户名和密码
      var reg = /^[a-z0-9]{3,18}$/i;
      // 获取用户名和密码
      var $uname = this.uname;
      var $upwd = this.upwd;
      // 验证用户名，如果格式不正确，提示格式错误
      if(!reg.test($uname)){
        this.$messagebox("消息","用户名格式不正确");
        return;
      }
      // 验证用户密码，如果格式不正确，提示格式错误
      if(!reg.test($upwd)){
        this.$messagebox("消息","密码格式不正确");
        return;
      }
      // 创建url变量，保存请求服务器地址
      var url = "login";
      // 创建obj变量，保存请求时参数
      var obj = {uname:$uname,upwd:$upwd};
      // 发送ajax请求
      this.axios.get(url,{params:obj}).then(res=>{
        // console.log(res.data);
      // 接受服务器返回结果
      // 如果-1 提示用户名或者密码错误
        if(res.data.code==-1){
          this.$messagebox("消息","用户名或者密码有误")
        }else{
          // 如果1 跳转到商品列表组件
          this.$toast("登陆成功");
          this.$router.push("/Index");
        }
      })
    }
  }
}
</script>
<style scoped>
  .login{
   background: linear-gradient(to top, #3778C6, #69C5B6);
   display: flex;
   flex-direction: column;
   align-items: center; 
  }
  .login>.title{
    color: #fff;
    font-size: 60px;
    font-weight: 500;
    padding-top: 150px;
  }
  #uname,#upwd{
    margin-top: 50px;
    width: 70%;
    padding:15px 20px;
    font-size: 25px;
    outline: none;
    border:1px solid #eee;
    background-color: #4E95BF;
    color: #eee;
    border-radius: 20px;
  }
  input::-webkit-input-placeholder{
    color: #eee
  }
  .btn{
    margin-top: 50px;
    margin-bottom: 50%;
    width: 75%;
    display:flex;
    justify-content: space-between;
  }
  .zc,.dl{
    outline: none;
    font-size: 24px;
    padding: 10px 40px;
    border-radius: 20px;
    color: #eee;
    background-color: #54AFF5;
    border:none;
  }
</style>