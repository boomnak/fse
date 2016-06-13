return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.15.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 27,
  height = 22,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 57,
  properties = {},
  tilesets = {
    {
      name = "RPG Basic",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/rpgtk.png",
      imagewidth = 544,
      imageheight = 384,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 204,
      tiles = {}
    },
    {
      name = "Special",
      firstgid = 205,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/triggers.png",
      imagewidth = 96,
      imageheight = 32,
      transparentcolor = "#ffffff",
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
        }
      }
    },
    {
      name = "entities",
      firstgid = 208,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/entities.png",
      imagewidth = 64,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 2,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "ground",
      x = 0,
      y = 0,
      width = 27,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzV1EEKgCAQBVAL5lxFBNFhOkkdqqPlIkEGdf4fJGjxd6Ov0UkJIQwqRyO6tpQpZixESAsx15j5zWZYiIf0l9wts1gPdfSZSsNjrdpeiJWbt/HtQlqWyVhpnyVm72BdgJXPf6nGY/eyEO+vVr7+BL3av9yjv1pta+ZZy6q1rNYd9LKsu2YsPR/e82PWsBbTi9fynNvXFvrOe+eutM5655G+kPnTb9QDMekfbA=="
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
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "test.lua"
          }
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'castle',32,224"
          }
        },
        {
          id = 53,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'overworld',128,64"
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "over",
      x = 0,
      y = 0,
      width = 27,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztwTEBAAAAwqD1T20Hb6AAAHgMCUgAAQ=="
    },
    {
      type = "tilelayer",
      name = "fadeoutud",
      x = 0,
      y = 0,
      width = 27,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztwzENAAAIA7D5FzWsoQKuNmmT9CkAwLV5vGcOKDA="
    },
    {
      type = "tilelayer",
      name = "fadeoutlr",
      x = 0,
      y = 0,
      width = 27,
      height = 22,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzbw0AfsBeI94zaNWrXqF2jdo3aNWrXqF2jdg0juwCnviBn"
    },
    {
      type = "tilelayer",
      name = "special",
      x = 0,
      y = 0,
      width = 27,
      height = 22,
      visible = false,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = "false",
        ["special"] = "true"
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJzV0cENACAIA0D2382d/BoTpC2IkcSXwCEOMxuNZw+lBq1n8yMr6sN4bGR2ifRkrTWXnR2ZWdmR1y9yui3FrrKU//rFQszXVsZDDNbyciqt070XyszM/pia7D/dsJS9dVvqXMqbWKf6TNU+Ofg="
    }
  }
}
