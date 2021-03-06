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
      name = "fade",
      firstgid = 257,
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
      firstgid = 261,
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
            ["solid"] = ""
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
      name = "minitree",
      firstgid = 264,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/minitree.png",
      imagewidth = 128,
      imageheight = 128,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 16,
      tiles = {}
    },
    {
      name = "tower",
      firstgid = 280,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tower.png",
      imagewidth = 64,
      imageheight = 64,
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
      name = "castle",
      firstgid = 284,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/castle.png",
      imagewidth = 64,
      imageheight = 64,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 4,
      tiles = {}
    }
  },
  layers = {
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
      data = "eJyN0rcOwzAMBFDl/z9FKd6V4l1pu1O8O8W70y6ACDAH0fHwBh3EAyjIO+fGMIEpzKAAr3JPZ32voCzAHBawhBWUlIcBnXKOsIYNbGEHe8pj6gx/Or8qOMARTnCGmvIqdUpvbh/RwAWucIM7tJQ3qVN6c/uIDh7whBe8wY1+8y51Sm9uH9H3zvrcqd7cPmLIG4uyZx8RjT5vsPrq9H7WXCCSWX1tej+eE5HorK+T50RFOLM6eU40hDOrj+f0fS2XWf/Wou9bGXd+AJN68Kw="
    },
    {
      type = "tilelayer",
      name = "locations",
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
      data = "eJxjYBj6QIaRgUGWkXrmyQHNkqeieSMFiIywMKOVfyWA5kpS0WwpoFnSwyRuAILcAQ8="
    },
    {
      type = "tilelayer",
      name = "trees",
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
      data = "eJxjYBgFgwlwMFLXPFFGwmZyMGLHuMzDZiaMz8GIUIOOsZmLTR6fGfjMJVUfJRjZv9SwH1t4DzbzsGF6hTcMAwA1mQtt"
    },
    {
      type = "tilelayer",
      name = "treetops",
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
      data = "eJxjYBgFgwnwMzIwCDFS10xePGYKM0LsxIbxuQPZTGQz+AjowWcuLxFm4NPHT+Vwwwc4gXZxo2EuCuwXw6JXfBCZx4slfZAaT9QAADNkArw="
    },
    {
      type = "objectgroup",
      name = "objects",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 64,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'throneroom',128,288"
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 352,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'dungeon1',32,352"
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'forest1',64,320"
          }
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'forest2',864,192"
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
      data = "eJxjZGSgGmACmsU4at6oeaPmjZpHI/MAsrYATA=="
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
      data = "eJxjZmRgYKYiHgWjYBSMAhhgYaQuBgCAHwC1"
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
      data = "eJxjZWRgYKUyphYYNY865hEyk9h4hIlhk8cnh8st6Gxy0hOxaqmdPtH9S6nZ+MJ7sJhHy7xOLAAABWYBzw=="
    }
  }
}
