using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Apoteka9
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
          
            MySqlConnection con = new MySqlConnection("server = localhost; database = mydb; username = root; password =; SSL Mode = None");
           // String username = boxUsername.Text;
            String password = boxPassword.Text;
            try
            {
                con.Open();
                String query = "SELECT * FROM zaposleni WHERE jmbg='" + password + "'";
                MySqlCommand com = new MySqlCommand(query, con);
                MySqlDataReader dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    if (dr[0].ToString().Equals(password))
                    {
                        int id = Convert.ToInt32(dr[0].ToString());
                        Form forma = new Main(id);
                        forma.Show();
                        this.Hide();
                    }
                    else MessageBox.Show("Nevažeće korisničko ime ili lozinka!");
                }
                else MessageBox.Show("Nevažeće korisničko ime ili lozinka!!");
            }
            catch (Exception exception) { MessageBox.Show(exception.Message); }
            finally { con.Close(); }
            
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Application.Exit();
        }

    
    }
}
