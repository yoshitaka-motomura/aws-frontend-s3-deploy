<script setup lang="ts"></script>

<template>
  <main>
    <h1>EC2 Content Deployed Powered by AWS CodeDeploy</h1>
    <p>
      Example:<a href="https://github.com/yoshitaka-motomura/aws-frontend-s3-deploy" target="_blank"
        >Github</a
      >
    </p>
    <p>Codepipline Start Trigger</p>
  </main>
</template>

<style scoped>
main {
  width: 100%;
}
h1 {
  font-size: 2rem;
  margin: 0;
  text-align: center;
  font-weight: 700;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
