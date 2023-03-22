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
    public partial class Main : Form
    {
        private int idKorisnika;
        public Main(int idkorisnika)
        {
            this.idKorisnika = idKorisnika;
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e)
        {

        }

        //prvi search
        private void button1_Click(object sender, EventArgs e)
        {
            String query = lekBuilder();
            Form form = new Form3(query, idKorisnika);
            form.Show();
        }


        //drugi search
        private void button2_Click(object sender, EventArgs e)
        {
            String query = ostaliBuilder();
            Form form = new Form2(query, idKorisnika);
            form.Show();
        }


        public String lekBuilder()
        {
            String query = "SELECT l.ime_leka, l.tip, p.cena, d.ime_dobavljaca, d.grad_dobavljaca FROM lek l inner join proizvod p on l.Proizvod_ID_proizvoda=p.ID_proizvoda inner join obezbeduje o on l.Proizvod_ID_proizvoda=o.ID_proizvoda inner join dobavljac d on o.ID_dobavljaca=d.ID_dobavljaca WHERE 1=1";
            if (!(lekBox.Text.Trim().Equals("")))
            {
                query += " AND l.ime_leka='" + lekBox.Text.Trim() + "'";
            }
            if(!(dobavljacBox.Text.Trim().Equals("")))
            {
                query += " AND d.ime_dobavljaca='" + dobavljacBox.Text.Trim() + " '";
            }
            if (!(minBox1.Text.Trim().Equals("")))
            {
                query += " AND p.cena >" + Convert.ToInt32(minBox1.Text.Trim());
            }
            if (!(maxBox1.Text.Trim().Equals("")))
            {
                query += " AND p.cena <" + Convert.ToInt32(maxBox1.Text.Trim());
            }


            return query;
        }

        public String ostaliBuilder()
        {
            String query = "SELECT l.ime, l.namena, p.cena, d.ime_dobavljaca, d.grad_dobavljaca FROM ostaliproizvodi l inner join proizvod p on l.Proizvod_ID_proizvoda=p.ID_proizvoda inner join obezbeduje o on l.Proizvod_ID_proizvoda=o.ID_proizvoda inner join dobavljac d on o.ID_dobavljaca=d.ID_dobavljaca WHERE 1=1";
            if (!(ostaloBox.Text.Trim().Equals("")))
            {
                query += " AND l.ime='" + ostaloBox.Text.Trim() + "'";
            }
            if (!(dobavljacBox1.Text.Trim().Equals("")))
            {
                query += " AND d.ime_dobavljaca='" + dobavljacBox1.Text.Trim() + " '";
            }
            if (!(namenaBox.Text.Trim().Equals("")))
            {
                query += " AND l.namena= '" + namenaBox.Text.Trim() + "'";
            }
            if (!(minBox2.Text.Trim().Equals("")))
            {
                query += " AND p.cena >" + Convert.ToInt32(minBox2.Text.Trim());
            }
            if (!(maxBox2.Text.Trim().Equals("")))
            {
                query += " AND p.cena <" + Convert.ToInt32(maxBox2.Text.Trim());
            }


            return query;
        }


    }
}
