return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.15.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 6,
  properties = {},
  tilesets = {
    {
      name = "Fullset 01",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/Fullset 01.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 256,
      tiles = {}
    },
    {
      name = "Tree0b",
      firstgid = 257,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/spr/Tree0b.png",
      imagewidth = 160,
      imageheight = 352,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 55,
      tiles = {}
    },
    {
      name = "tree3b",
      firstgid = 312,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/spr/tree3b.png",
      imagewidth = 160,
      imageheight = 352,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 55,
      tiles = {}
    },
    {
      name = "fade",
      firstgid = 367,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/fade.png",
      imagewidth = 128,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 4,
      tiles = {}
    },
    {
      name = "triggers",
      firstgid = 371,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/triggers.png",
      imagewidth = 96,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 3,
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = "true",
            ["solid"] = "true"
          }
        },
        {
          id = 2,
          properties = {
            ["collidable"] = "true",
            ["ladder"] = "true"
          }
        }
      }
    },
    {
      name = "green king",
      firstgid = 374,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 32,
      image = "../img/spr/green king.png",
      imagewidth = 2496,
      imageheight = 96,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 234,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "bg",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJyzY2BgsBvFo3gUj+IhgAHptkip"
    },
    {
      type = "tilelayer",
      name = "dirt",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUkArCgTgCiCPR2IQwNnNAOB2IM4A4E019JgGMzZx0NPPwYXR14lCMzRxxErEEEKtTEWsAMQAUDxiz"
    },
    {
      type = "tilelayer",
      name = "grass",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUkApmA/EcJHouEM8D4vlAvACPOC5zqOWewWIOrQAADAkMPw=="
    },
    {
      type = "tilelayer",
      name = "trees1",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzVzMVOQ1EUBdDXCe5SXIu2uM5xK+7uDv8/ZH3AvQmECZxkZU/22Uny/24ulSTzLLDIUur7nQJZSBHFlLDMCqussR7Yi3VKZRnlVFDJBnk22WI7sBfrVMlqaqiljh122WOfg8BerFMv0zTQSBOHHHHMCaeBvVinWbbQShvtnHHOBZdcBfZinQ7ZSRfdZLjmhlvuuA/sxTo9spc++hnggUeeeOYlsBfrDMosOYYY5pU33vngM7AX64zIUcYYZyLw+5Ob9D/FNDPM/nLvr98XcgYlcg=="
    },
    {
      type = "tilelayer",
      name = "entity",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2BogLmM1DXvFZXNGwW0BwDTgAGK"
    },
    {
      type = "objectgroup",
      name = "object",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 32,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'overworld',224,160"
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 64,
          width = 32,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'forest2',64,320"
          }
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 256,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "merchant.lua",
            ["oncePerCollision"] = ""
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "fadelr",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzLZ2SgGigAmpU/at6oeaPmjZpHI/MABK8NMA=="
    },
    {
      type = "tilelayer",
      name = "fadeud",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJwrZGRgKKQiHgWjYBSMAhgoYqQuBgDtVxHl"
    },
    {
      type = "tilelayer",
      name = "special",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = false,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJwrZmRgKKYyphagtnkwMwezeaNgaABq5Q1q5ZvBZg6tAABmchXB"
    }
  }
}
