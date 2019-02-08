<template>
  <div>
    <img v-if="userInfo != null" :src="this.userInfo.avatar_url" width="100"/>
    <p>{{username}}</p>
  </div>
</template>

<script>
export default {
  name: 'User',
  props: {
    username: String
  },
  data: () => ({
    userInfo: null
  }),
  created() {
      fetch(`https://api.github.com/users/${this.username}`)
        .then(res => res.json())
        .then(json => this.userInfo = json)
        .catch(e => console.error(e))
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
img {
  border-radius: 100px;
}
</style>
