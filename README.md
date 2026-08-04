# Gmod_Complie_Model_QC

基于 Starfelll 的 `ultimate_survivor_qc` 优化，更适合 Gmod 宝宝的角色模型编译模板。

> **作者**: Starfelll、糯米饭团  
> **适用引擎**: Source / Garry's Mod  
> **编译器**: nekomdl

---

## 📁 目录结构

```
Gmod_Complie_Model_QC/
├── Complie_Model_dc.qci    # 主编译配置
├── bodygroups.qci          # 身体组配置
├── materials.qci           # 材质路径配置
├── flexbone.qci            # 飘动骨骼配置
├── model.vrd               # 程序化骨骼定义
├── 批量编译角色.bat         # 批量编译脚本
│
├── characterQC/            # 角色 QC 入口文件（正在扩展中）
│   ├── alyx.qc             # Alyx 女性角色
│   ├── alyx_ep2.qc         # Alyx EP2
│   ├── alyx_interior.qc    # Alyx 梵蒂冈治疗阶段
│   ├── alyx_intro.qc       # Alyx 介绍
│   ├── female_npc.qc       # 女性 NPC
│   ├── female_pm.qc        # 女性玩家模型
│   ├── male_npc.qc         # 男性 NPC
│   └── male_pm.qc          # 男性玩家模型
│
├── QCI/                    # 核心包含文件
│   ├── DefineBones.qci     # 骨骼定义
│   ├── Attachment.qci      # 附件点定义
│   ├── box.qci             # 碰撞盒 / 命中盒
│   ├── IKrules.qci         # IK 规则
│   ├── ragdoll.qci         # 布娃娃配置
│   ├── alyx_flex.qci       # Alyx 形态键
│   ├── gmod_flex.qci       # Gmod 专用形态键
│   └── VRD.qci             # VRD 骨骼
│
├── animation/              # 动画配置
│   ├── pps.qci             # Ref比例定位系统（核心）
│   ├── anims_alyx.qci      # Alyx 动画集
│   ├── anims_male_npc.qci  # 男性 NPC 动画集
│   ├── anims_female_npc.qci# 女性 NPC 动画集
│   ├── anims_male_pm.qci   # 男性 PM 动画集
│   ├── anims_female_pm.qci # 女性 PM 动画集
│   ├── anims_combine_soldier.qci  # 联合军士兵动画集
│   └── anims_police.qci    # 警察动画集
│
├── anims/                  # 动画 SMD 文件
│   ├── ref.smd             # 参考姿势（女性）
│   ├── ref_male.smd        # 参考姿势（男性）
│   └── ragdoll.smd         # 布娃娃姿势
│
├── smd/                    # 模型 SMD 文件
│   └── npc_physics.smd     # NPC 物理模型参考
│
├── dmx/                    # DMX 格式模型（空目录，放你的模型）
├── gltf/                   # glTF 格式模型（空目录，放你的模型）
├── pdgg/                   # 飘动骨骼配置（空目录，放你的配置）
│
├── 第一人称/                # 第一人称手臂模板
│   ├── c_hands.qc          # 手臂 QC 入口
│   ├── c_hands.vrd         # 手臂程序化骨骼
│   ├── materials.qci       # 手臂材质
│   ├── flexbone.qci        # 手臂飘动骨骼入口
│   ├── qci/                # 手臂 QCI 文件
│   ├── smd/                # 手臂 SMD 文件
│   ├── anims/              # 手臂动画
│   └── pdgg/               # 手臂飘动骨骼配置
│
├── 静态物品/                # 静态道具模板
│   ├── dropProps.qc        # 道具 QC 入口
│   ├── smd/                # 道具 SMD 文件
│   └── anims/              # 道具动画
│
└── 封包/                    # 打包输出目录
    └── character/          # 角色模型输出
```

---

## ✨ 功能特性

### 🎭 多角色骨架支持
- **Alyx 系**：女性角色骨架，适配 most anime/二次元角色
- **Male 系**：男性角色骨架，适配男性 NPC / PM
- **Combine Soldier**：联合军士兵骨架
- **Police**：警察骨架

### 🔧 Ref 比例定位系统
内置 Ref（Proportions Positioning System）自动适配：
- 自动对齐骨骼位置到标准参考骨架
- 支持自定义根骨垂直偏移 (`pps_z_delta`)
- 支持小腿外翻修正 (`calf_ik_fix`)
- 支持脚部垂直位置修正 (`foot_ik_fix`)

### 📦 多格式模型支持
- **SMD**：传统 Source 模型格式
- **DMX**：Valve 二进制模型格式（支持形态键和法向）
- **glTF / GLB**：现代 3D 格式（通过 nekomdl 扩展支持）

### 🦴 完整的角色系统
- ✅ 身体组（BodyGroups）切换
- ✅ 形态键（Flex）面部表情
- ✅ 附件点（Attachments）预设
- ✅ 碰撞盒 / 命中盒（Hitboxes）
- ✅ IK 链规则
- ✅ 布娃娃（Ragdoll）物理
- ✅ 程序化骨骼（VRD）
- ✅ 材质族（Skinfamilies）切换
- ✅ 飘动骨骼（Flexbone）
- ✅ 第一人称手模（C_hands）

---

## 🚀 快速开始

### 1. 准备模型文件
将你的模型文件放入对应目录：
- SMD 格式 → `smd/`
- DMX 格式 → `dmx/`
- glTF 格式 → `gltf/`

### 2. 配置主参数
编辑 `Complie_Model_dc.qci`，修改以下变量：

```qci
// 模型名称（用于输出文件名）
$DefineVariable custom_model_name "你的角色名"

// 模型文件路径
$DefineVariable custom_model "smd/body.smd"

// 使用的参考动画骨架：alyx / male / combine_soldier / police
$DefineVariable ref_model alyx

// 根骨垂直位置调整（正数向下，负数向上）
$DefineVariable pps_z_delta 0

// 小腿外翻修正（从 0.5 开始调试）
$DefineVariable calf_ik_fix 0

// 脚部垂直位置修正（1、2、3...）
$DefineVariable foot_ik_fix 0
```

### 3. 配置材质
编辑 `materials.qci`：
```qci
$cdmaterials "models/你的角色名/"
```

### 4. 配置身体组
编辑 `bodygroups.qci`，添加更多可切换部件：
```qci
$BodyGroup "body"
{
    studio "smd/body.smd"
    blank
}

// 示例：添加头发身体组
$BodyGroup "hair"
{
    studio "smd/hair_default.smd"
    studio "smd/hair_alt.smd"
    blank
}
```

### 5. 选择角色入口
在 `characterQC/` 中选择合适的 QC 文件作为入口，或新建一个：

```qci
// characterQC/你的角色.qc
$ModelName "models/你的角色名.mdl"
$DefineVariable character alyx  // alyx / male_npc / female_npc / ...
$Include "../Complie_Model_dc.qci"
```

### 6. 编译
使用 `nekomdl` 编译器编译：
```bash
nekomdl -quiet -outdir "./" -parsecompletion -Drelease 1 characterQC/你的角色.qc
```

或直接运行批量编译脚本：
```
批量编译角色.bat
```

---

## 🎯 角色类型说明

| 角色类型 | 骨架 | 适用场景 | 动画集 |
|---------|------|---------|--------|
| `alyx` | Alyx | 标准女性角色 | Alyx 全套动画 |
| `female_npc` | Alyx | 女性 NPC | 女性 NPC 动画 |
| `female_pm` | Alyx | 女性玩家模型 | 女性 PM 动画 |
| `male_npc` | Male | 男性 NPC | 男性 NPC 动画 |
| `male_pm` | Male | 男性玩家模型 | 男性 PM 动画 |
| `combine_soldier` | 联合军 | 士兵类角色 | 联合军动画 |
| `police` | 警察 | 警察类角色 | 警察动画 |

---

## 🖐️ 第一人称手臂模板

`第一人称/` 目录提供了独立的手臂模型编译模板：

1. 将手臂模型放入 `第一人称/smd/`
2. 编辑 `第一人称/c_hands.qc` 配置参数
3. 编辑 `第一人称/materials.qci` 设置材质路径
4. 使用 nekomdl 编译 `c_hands.qc`

---

## 📦 静态物品模板

`静态物品/` 目录提供了静态道具编译模板：

1. 将道具模型放入 `静态物品/smd/`
2. 编辑 `静态物品/dropProps.qc` 配置参数
3. 设置碰撞模型和物理参数
4. 编译输出

---

## 🔧 常用调试技巧

### 模型位置不对
- 调整 `pps_z_delta`：正数向下移，负数向上移
- 确保blender编辑模式下，模型盆骨相对于官模盆骨的位置，尽量在不越过网格边界的情况下和官模盆骨接近或对齐

### 脚部穿模 / 浮空
- 调整 `foot_ik_fix` 参数
- 检查脚部骨骼位置

### 小腿外翻
- 调整 `calf_ik_fix` 参数（从 0.5 开始尝试）

### 动画不对
- 确认 `ref_model` 变量设置正确
- 检查角色类型与动画集是否匹配

### 材质不显示
- 检查 `$cdmaterials` 路径是否正确
- 确认 VMT 文件路径与模型中的材质名匹配

### 布娃娃飞天、遁地、消失、无效果等
- 布娃娃 `npc_physics.smd` 网格数量过多，建议合并布娃娃网格
- 未生效的布娃娃网格大小过小，建议略大于其对应顶点组所绑定骨骼的大小（视觉上）

---

## 📝 注意事项

1. **编译器要求**：必须使用 `nekomdl` 编译器，标准 `studiomdl` 不支持模板中的部分扩展语法
2. **骨骼命名**：模型骨骼（主干骨）必须严格遵循 `ValveBiped.Bip01_*` 命名规范
3. **单位**：Source 引擎单位为英寸，1 单位 = 1 英寸
4. **面数**：Gmod 单个模型（smd/dmx/gltf）建议不超过 20w 面，可能会导致网格撕裂问题
5. **材质**：使用 VTF/VMT 材质，确保 `$cdmaterials` 路径正确
6. **骨骼数量**：模型所有种类骨骼之和目前上限为256，超过会编译失败或者引起游戏崩溃

---

## 📚 参考资源

- [Valve Developer Wiki - QC 语法](https://developer.valvesoftware.com/wiki/Qc)
- [ultimate_survivor_qc 文档](https://github.com/Starfelll/L4D2_Utils)
- [【Blender X Gmod】零基础上手全流程布兰德Gmod模组制作](https://www.bilibili.com/video/BV1iZ421M7rx)
- [Starfelll - neko糕手的BiliBili主页](https://space.bilibili.com/644686972)

---

## 📄 许可证

本模板基于 Starfelll 的 `ultimate_survivor_qc` 优化修改，仅供学习和非商业用途使用。
