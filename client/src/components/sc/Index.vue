<template>
  <div class="main">
    <div class="input ">
      <input type="text" placeholder="搜索商品名称">
      <div class="search iconfont icon-sousuo"></div>
    </div>
    <van-swipe :autoplay="5000">
      <van-swipe-item v-for="(image, index) in images" :key="index">
        <img v-lazy="image" class="images"/>
      </van-swipe-item>
    </van-swipe>
    <div class="dh">
      <ul>
        <li @click="list1()">
          <p class="tb iconfont icon-shouji"></p>
          <p class="title">手机</p>
        </li>
        <li @click="list2()">
          <p class="tb iconfont icon-bijibendiannao"></p>
          <p class="title">笔记本电脑</p>
        </li>
        <li @click="list3()">
          <p class="tb iconfont icon-lingshi"></p>
          <p class="title">零食</p>
        </li>
        <li @click="list4()">
          <p class="tb iconfont icon-yifu"></p>
          <p class="title">衣服</p>
        </li>
      </ul>
    </div>
    <div class="lists">
      <p class="tj">产品推荐</p>
      <ul>
        <li v-for="(item,i) of list" :key="i">
          <img class="pic" :src="`http://127.0.0.1:4000/${item.pic}`" alt="" @click="detail(item.did)">
          <p class="price" >¥{{item.price}}</p>
          <p class="title">{{item.title}}</p>
          <p class="pj">已有{{item.evaluate}}+人评价</p>
          <div class="dp">
            <p>{{item.store}}</p>
            <span class="iconfont icon-dianpu"></span>
          </div>
          <button class="btn">加入购物车</button>
        </li>
      </ul>
    </div>
    <van-tabbar route>
      <van-tabbar-item replace to="/index" icon="home-o">
        首页
      </van-tabbar-item>
      <van-tabbar-item replace to="/cart" icon="shopping-cart-o">
        购物车
      </van-tabbar-item>
    </van-tabbar>
  </div>
</template>
<script>
import {Notify} from "vant";
export default {
  data() {
    return {
      images: [
        'http://127.0.0.1:4000/images/01.jpg',
        'http://127.0.0.1:4000/images/02.jpg',
        'http://127.0.0.1:4000/images/03.jpg',
        'http://127.0.0.1:4000/images/04.jpg'
      ],
      active: 'Index',
      list:[],
      did:0
    }
  },
  created(){
    this.loadMore()
  },
  methods: {
    onChange(index) {
      Notify({ type: 'primary', message: index });
    },
    list1(){
      var id = 1;
      this.$router.push({path:'/List',query:{userid:id}});
    },
    list2(){
      var id = 2;
      this.$router.push({path:'/List',query:{userid:id}});
    },
    list3(){
      var id = 3;
      this.$router.push({path:'/List',query:{userid:id}});
    },
    list4(){
      var id = 4;
      this.$router.push({path:'/List',query:{userid:id}});
    },
    loadMore(){
      // 发送ajax请求
      // console.log(1);
      this.axios.get("product").then(res=>{
        this.list=this.list.concat(res.data.data)
        // console.log(this.list);
        
      })
    },
    detail(did){
      var id = did;
      this.$router.push({path:'/Details',query:{did:id}});
    }
  }
}
</script>
<style scoped>
  .my-swipe .van-swipe-item {
    color: #fff;
    font-size: 20px;
    height: 250px;
    text-align: center;
    background-color: #39a9ed;
  }
  .images{
    width: 100%;
    height: 250px;
  }
  .main>.input{
    padding: 20px;
    background-color: #f2f2f2;
    position: relative;
  }
  .main>.input>input{
    width: 90%;
    padding: 10px 20px;
    font-size: 18px;
    color:#666;
    border-radius: 20px;
    box-shadow: none;
    border: none;
  }
  .search{
    position: absolute;
    top:38%;
    right: 45px;
    font-size: 20px;
  }
  .main>.dh{
    /* width: 100%; */
    padding: 20px 40px;
  }
  .main>.dh>ul{
    list-style: none;
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 0 auto;
  }
  .main>.dh>ul>li{
    width: 20%;
    margin-bottom: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .main>.dh>ul>li>.tb{
    width:80px;
    height: 80px;
    font-size: 40px;
    border-radius: 50%;
    text-align: center;
    line-height: 80px;
    color: #fff;
  }
  .main>.dh>ul>li>.title{
    font-size: 20px;
  }
  .main>.dh>ul>li:first-child>.tb{
    background-color: #60CC1E;
  }
  .main>.dh>ul>li:nth-child(2)>.tb{
    background-color: #22D59B;
  }
  .main>.dh>ul>li:nth-child(3)>.tb{
    background-color: #346CFF;
  }
  .main>.dh>ul>li:nth-child(4)>.tb{
    background-color: #B033FF;
  }
  .main>.lists{
    background-color: #F4F4F4;
    padding: 0 20px;
    margin-bottom:60px;
  }
  .main>.lists::before{
    content: "";
    display: block;
    clear: both;
  }
  .main>.lists>.tj{
    font-size: 25px;
    font-weight: 700;
    padding: 20px 0;
    text-align: center;
  }
  .main>.lists>ul{
    width: 100%;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
  }
  .main>.lists>ul>li{
    width: 45%;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    padding: 0 10px;
    margin-bottom: 20px;
  }
  .main>.lists>ul>li>.pic{
    width: 100%;
    height: 250px;
  }
  .main>.lists>ul>li>.price{
    color: #e4393c;
    font-size: 26px;
    margin-top: 15px;
  }
  .main>.lists>ul>li>.title{
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 20px;
    margin-top: 5px;
  }
  .main>.lists>ul>li>.pj{
    font-size: 20px;
    margin-top: 5px;
  }
  .main>.lists>ul>li>.dp{
    display: flex;
    align-items: center;
    font-size: 18px;
    margin-top: 5px;
  }
  .main>.lists>ul>li>.dp>p{
    margin-right: 5px;
  }
  .main>.lists>ul>li>.dp>span{
    font-size: 18px;
    color: #9ABDFF;
  }
  .main>.lists>ul>li>.btn{
    margin-top: 5px;
    padding: 7px 0;
    border:1px solid #999;
    font-size: 22px;
    border-radius: 3px;
    margin-bottom: 10px;
  }
</style>