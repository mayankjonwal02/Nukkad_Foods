const mongoose = require("mongoose")
const { Schema } = mongoose

const DepartmentSchema = new Schema([
    {
        departmentName : {
            type : String,
            required : true
        
        },
        options : [
            {
                type : String,
                required : true
            }
        ]
    }
])


const addDepartment = async (req,res) => {
    const {departmentName,options} = req.body
    try {

        const db = mongoose.connection.useDb('NukkadFoods')
        const Department = db.model('Department', DepartmentSchema)
        const exist = await Department.findOne({departmentName})
        if(exist) return res.json({message:"Department Already Exist"})
        const department = new Department({
            departmentName,
            options
        })
        await department.save()
        return res.json({message:"Department Added Successfully"})
    } catch (error) {
        return res.json({error})
    }
}

const getDepartment = async (req,res) => {
    try {
        const db = mongoose.connection.useDb('NukkadFoods')
        const Department = db.model('Department', DepartmentSchema)
        const departments = await Department.find()
        return res.json({departments})
    } catch (error) {
        return res.json({error})
    }
}

const getDepartmentByName = async (req,res) => {
    const {departmentName} = req.body
    try {
        const db = mongoose.connection.useDb('NukkadFoods')
        const Department = db.model('Department', DepartmentSchema)
        const department = await Department.findOne({departmentName})
        return res.json({department:department})
    } catch (error) {
        return res.json({error})
    }
}


const updateDepartment = async (req,res) => {
    const {id,departmentName,options} = req.body
    try {
        const db = mongoose.connection.useDb('NukkadFoods')
        const Department = db.model('Department', DepartmentSchema)


        await Department.updateOne({_id:id},{departmentName,options})

        return res.json({message:"Department Updated Successfully"})
    } catch (error) {
        return res.json({error})
    }
}

const deleteDepartment = async (req,res) => {
    const {departmentName} = req.body
    try {
        const db = mongoose.connection.useDb('NukkadFoods')
        const Department = db.model('Department', DepartmentSchema)
        await Department.deleteOne({departmentName})
        return res.json({message:"Department Deleted Successfully"})
    } catch (error) {
        return res.json({error})
    }
}



module.exports = {addDepartment,getDepartment,deleteDepartment,getDepartmentByName,updateDepartment}
