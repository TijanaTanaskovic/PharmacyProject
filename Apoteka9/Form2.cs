using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Apoteka9
{
    public partial class Form2 : Form
    {
        private int idKorisnika;

        String query;
        int current;
        int total;

        List<String> ime = new List<String>();
        List<String> tip = new List<String>();
        List<String> cena = new List<String>();
        List<String> dobavljac = new List<String>();
        List<String> grad = new List<String>();

        public Form2(String query, int idKorisnika)
        {
            InitializeComponent();
            this.idKorisnika = idKorisnika;
            this.query = query;
            ExecuteQuery(query);
            if (total > 0) setWindow(0);

        }

        public void ExecuteQuery(String query)
        {
            MySqlConnection con = new MySqlConnection("server = localhost; database = mydb; username = root; password =; SSL Mode = None");
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(query, con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    current = 0;
                    total = 0;
                    while (dr.Read())
                    {
                        total++;
                        ime.Add(dr[0].ToString());
                        tip.Add(dr[1].ToString());
                        cena.Add(dr[2].ToString());
                        dobavljac.Add(dr[3].ToString());
                        grad.Add(dr[4].ToString());

                    }
                }
                else
                {
                    MessageBox.Show("Nije pronadjen nijedan rezultat pretrage");
                    this.Close();
                }
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public void setWindow(int x)
        {
            label1.Text = ime[x];
            label2.Text = "(" + tip[x] + ")";
            label3.Text = cena[x] + "RSD";
            label4.Text = dobavljac[x];
            label5.Text = grad[x];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (current == 0)
            {
                current = total - 1;
            }
            else
            {
                current--;
            }
            setWindow(current);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (current == total - 1)
            {
                current = 0;
            }
            else
            {
                current++;
            }
            setWindow(current);
        }
    }
}
