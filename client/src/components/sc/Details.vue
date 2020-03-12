<template>
  <div class="detail">
    <button class="looktg" @click="fh()">返回</button>
    <p class="lb">详情页</p>
    <div class="content">
      <img :src="`http://127.0.0.1:4000/${pic}`" alt="">
      <div class="right">
        <ul>
          <li>
            <p class="title">{{title}}</p>
          </li>
          <li>
            <span>价格</span>
            <p>¥{{price}}</p>
          </li>
          <li>
            <span>促销</span>
            <p>{{discounts}} >></p>
          </li>
          <li>
            <button class="btn">加入购物车</button>
          </li>
        </ul>
      </div>
    </div>
  </div>  
</template>
<script>
export default {
   data() {
    return {
      list:[],
      pic:"images/md-1.jpg",
      title:"",
      price:"",
      discounts:""
    }
  },
   created(){
    this.loadMore()
  },
   methods: {
      fh(){
         this.$router.go(-1);
      },
      loadMore(){
        var id = this.$route.query.did;
        var obj = {did:id};
        this.axios.get("details",{params:obj}).then(res=>{
          this.list=this.list.concat(res.data.data)
          // console.log(this.list);
          this.pic=this.list[0].pic;
          this.title=this.list[0].title;
          this.price=this.list[0].price;
          this.discounts=this.list[0].discounts;
        })
      }
   }
}
</script>
<style scoped>
  .detail{
    background-color: #F4F4F4;
    padding: 0 20px;
    margin-bottom:60px;
  }
  .detail::before{
    content: "";
    display: block;
    clear: both;
  }
  .detail>.lb{
    font-size: 25px;
    font-weight: 700;
    padding: 20px 0;
    text-align: center;
  }
  .detail>.looktg{
    padding: 8px 25px;
    font-size: 18px;
    border:1px solid #999;
    border-radius: 3px;
    margin-top: 20px;
  }
  .detail>.content{
    display: flex;
    justify-content: space-between;
  }
  .detail>.content>img{
    width: 40%;
    height: 250px;
  }
  .detail>.content>.right{
    width: 58%;
    display: flex;
    flex-direction: column;
  }
  .detail>.content>.right>ul{
    list-style: none;
  }
  .detail>.content>.right>ul>li{
    margin: 10px 0;
    display: flex;
    align-items: center;
  }
  .detail>.content>.right>ul>li:first-child>.title{
    font-size: 20px;
  }
  .detail>.content>.right>ul>li>span{
    font-size: 18px;
    margin-right: 10px;
  }
  .detail>.content>.right>ul>li:nth-child(2)>p{
    color: #e4393c;
    font-size: 26px;
  }
  .detail>.content>.right>ul>li:nth-child(3)>p{
    font-size: 20px;
  }
  .detail>.content>.right>ul>:last-child>.btn{
    padding: 8px 25px;
    font-size: 18px;
    background-color: #e4393c;
    color: #fff;
    border:1px solid #999;
    border-radius: 3px;
    margin-top: 20px;
    margin-bottom: 20px;
  }
</style>