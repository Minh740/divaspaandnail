using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserManager
/// </summary>
public class UserManager
{
    DataClassesDataContext db = new DataClassesDataContext();

    public void Save()
    {
        db.SubmitChanges();
    }

    // get id user
    public UsersTbx GetUserByID(int id)
    {
        return db.UsersTbxes.Where(u => u.UserId == id && u.Status == 1).FirstOrDefault();
    }

    public UsersTbx GetUserNameByEmail(string email)
    {
        return db.UsersTbxes.Where(u => u.Email == email && u.Status == 1).FirstOrDefault();
    }

    public string GetEmailByID(int id)
    {
        return db.UsersTbxes.Where(e => e.Status == 1 && e.UserId == id).Select(e => e.Email).FirstOrDefault();
    }

    //public UsersTbx GetUserByUserName(string username)
    //{
    //    return db.UsersTbxes.Where(u => u.UserName == username && u.Status == 1).FirstOrDefault();
    //}
    public UsersTbx GetUserByUserEmail(string email)
    {
        return db.UsersTbxes.Where(u => u.Email == email && u.Status == 1).FirstOrDefault();
    }
    // get userid by phone
    public UsersTbx GetUserByUserPhone(string phone)
    {
        return db.UsersTbxes.Where(u => u.PhoneNumber == phone && u.Status == 1).FirstOrDefault();
    }
    // get list user
    public List<UsersTbx> GetUserList()
    {
        return db.UsersTbxes.Where(u => u.Status == 1).ToList();
    }

    // add user
    public void AddUser(UsersTbx user)
    {
        db.UsersTbxes.InsertOnSubmit(user);
        Save();
    }

    public List<UsersTbx> SearchByID(string id)
    {
        return db.UsersTbxes.Where(u => u.UserId.ToString().Contains(id) && u.Status != -1).ToList();
    }

    public List<UsersTbx> SearchByEmail(string email)
    {
        return db.UsersTbxes.Where(u => u.Email.Contains(email) && u.Status != -1).ToList();
    }
    public List<UsersTbx> SearchByPhone(string phone)
    {
        return db.UsersTbxes.Where(u => u.PhoneNumber.Contains(phone) && u.Status != -1).ToList();
    }


    public List<UsersTbx> Search(string query)
    {
        query = query.ToLower().Trim();
        return db.UsersTbxes.Where(u => (u.Email.Contains(query) || u.FirstName.Contains(query) || u.LastName.Contains(query) || u.PhoneNumber.Contains(query) && u.Status == 1)).ToList();
    }

    /// <summary>
    /// Search user to add new reward
    /// </summary>
    /// <param name="searchStr"></param>
    /// <returns></returns>
    public UsersTbx SearchUserByNameOrPhone(string searchStr)
    {
        searchStr = searchStr.ToLower();
        return db.UsersTbxes.Where(u => u.PhoneNumber == searchStr && u.Status != -1).FirstOrDefault();
    }

    public UsersTbx GetByToken(string token)
    {
        return db.UsersTbxes.Where(u => u.Token == token && u.Status == 1).FirstOrDefault();
    }

    public List<UsersTbx> GetListUserByUserEmail(string email)
    {
        return db.UsersTbxes.Where(e => e.Status == 1 && e.Email == email).ToList();
    }

    public UsersTbx GetByID(int id)
    {
        return db.UsersTbxes.Where(u => u.UserId == id).FirstOrDefault();
    }

}