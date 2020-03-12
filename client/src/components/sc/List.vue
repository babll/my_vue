<template>
  <div class="lists">
    <button class="looktg" @click="fh()">返回</button>
    <p class="lb">商品列表</p>
      <ul>
        <li v-for="(item,i) of list" :key="i">
          <img class="pic" :src="`http://127.0.0.1:4000/${item.pic}`" alt="" @click="detail(item.did)">
          <p class="price">¥{{item.price}}</p>
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
</template>
<script>
export default {
  data() {
    return {
      list:[]
    }
  },
   created(){
    this.loadMore()
  },
   methods: {
      fh(){
        this.$router.push("/Index");
      },
      loadMore(){
        var id = this.$route.query.userid;
        //  console.log(id)
        var obj = {id:id};
        this.axios.get("list",{params:obj}).then(res=>{
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
  .lists{
    background-color: #F4F4F4;
    padding: 0 20px;
    margin-bottom:60px;
  }
  .lists::before{
    content: "";
    display: block;
    clear: both;
  }
  .lists>.lb{
    font-size: 25px;
    font-weight: 700;
    padding: 20px 0;
    text-align: center;
  }
  .lists>.looktg{
    padding: 8px 25px;
    font-size: 18px;
    border:1px solid #999;
    border-radius: 3px;
    margin-top: 20px;
  }
  .lists>ul{
    width: 100%;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
  }
  .lists>ul>li{
    width: 45%;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    padding: 0 10px;
    margin-bottom: 20px;
  }
  .lists>ul>li>.pic{
    width: 100%;
    height: 250px;
  }
  .lists>ul>li>.price{
    color: #e4393c;
    font-size: 26px;
    margin-top: 15px;
  }
  .lists>ul>li>.title{
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 20px;
    margin-top: 5px;
  }
  .lists>ul>li>.pj{
    font-size: 20px;
    margin-top: 5px;
  }
  .lists>ul>li>.dp{
    display: flex;
    align-items: center;
    font-size: 18px;
    margin-top: 5px;
  }
  .lists>ul>li>.dp>p{
    margin-right: 5px;
  }
  .lists>ul>li>.dp>span{
    font-size: 18px;
    color: #9ABDFF;
  }
  .lists>ul>li>.btn{
    margin-top: 5px;
    padding: 7px 0;
    border:1px solid #999;
    font-size: 22px;
    border-radius: 3px;
    margin-bottom: 10px;
  }
</style>