import argparse
import datetime
import sys

god = {
    2026: {
        # start_date is a wednesday as in1000 weeks start on wednesdays and end on tuesdays
        "start_date": datetime.date(2026, 8, 19),
        "obligs": {
            1: {
                "relevant_weeks": (1,),
                "frist": (temp := datetime.date(2026, 8, 25)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    0: "Filsystem og kjøring av Python-programmer",
                    1: "Utskrift og innlesing med variabler",
                    2: "Problemløsning",
                },
                "quiz": True,
                "gif_url": None,
            },
            2: {
                "relevant_weeks": (2,),
                "frist": (temp := datetime.date(2026, 9, 1)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "Utskriftsprosedyre",
                    2: "Konvertering",
                    3: "Kodeflyt",
                    4: "Kodeflyt",
                    5: "Egen Oppgave",
                },
                "quiz": True,
                "gif_url": None,
            },
            3: {
                "relevant_weeks": (3,),
                "frist": (temp := datetime.date(2026, 9, 8)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "Lister",
                    2: "Samling",
                    3: "Billettpris",
                    4: "Matplan",
                    5: "Egen Oppgave",
                },
                "quiz": True,
                "gif_url": None,
            },
            4: {
                "relevant_weeks": (4,),
                "frist": (temp := datetime.date(2026, 9, 15)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "Regning med løkker",
                    2: "Reiseplan",
                    3: "Løkker og lister",
                    4: "Egen oppgave",
                },
                "quiz": True,
                "gif_url": None,
            },
            5: {
                "relevant_weeks": (5, 6),
                "frist": (temp := datetime.date(2026, 9, 29)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "Parametre og returverdier",
                    2: "Å telle bokstaver og ord",
                    3: "Temperatur",
                    4: "Regnefunksjoner",
                    5: "UiO-brukere",
                    6: "Egen oppgave",
                },
                "quiz": True,
                "gif_url": "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZG54c2dtZGQwc3p6dTdhenRoNHg5M3MwZDdpNHhjZmt3NjVjaDQyciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Hcu9MTtCRRszQIys23/giphy.gif",
            },
            6: {
                "relevant_weeks": (7,),
                "frist": (temp := datetime.date(2026, 10, 6)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "Motorsykkel",
                    2: "Teorioppgave",
                    3: "Hund",
                    4: "Dato",
                    5: "Viktige begreper i objektorientert programmering",
                    6: "Egen oppgave",
                },
                "quiz": True,
                "gif_url": "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExcThvYnJnODQ3YjU0c2t4YTJsN3M5aTM0b2xmOG1nbHYya2Q4bnhxZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/kLPgPCS9QplpgX8ec2/giphy.gif",
            },
            7: {
                "relevant_weeks": (8, 9),
                "frist": (temp := datetime.date(2026, 10, 20)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "",
                    2: "",
                    3: "",
                    4: "",
                },
                "quiz": True,
                "gif_url": None,
            },
            8: {
                "relevant_weeks": (10, 11),
                "frist": (temp := datetime.date(2026, 11, 3)),
                "rettefrist": temp + datetime.timedelta(days=7),
                "problems": {
                    1: "",
                    2: "",
                    3: "",
                    4: "",
                },
                "quiz": True,
                "gif_url": None,
            },
        },
    }
}

parser = argparse.ArgumentParser(
    prog="generate_template", description="Generates templates for in1000 assignments"
)
parser.add_argument(
    "tasks_done", type=str, help="Comma separated oppg#, and q for quiz. Like q,0,1,6"
)
parser.add_argument(
    "--oblig_nr",
    "-n",
    type=int,
    help="1-8. Defaults to attempting to calculate automatically, based on current time and date.",
)
args = parser.parse_args()

tasks_done_temp = args.tasks_done.strip().split(",")
tasks_done = set()
quiz_done = False
for i in range(len(tasks_done_temp)):
    if tasks_done_temp[i] == "q":
        quiz_done = True
    else:
        tasks_done.add(int(tasks_done_temp[i]))
curr_date = datetime.date.today()


if curr_date.year not in god:
    print("No data exists for the current year! Update the script!")
    sys.exit(1)

obligs = god[curr_date.year]["obligs"]

if args.oblig_nr is None:
    closest_oblig_nr = max(obligs)

    for oblig_nr, oblig in obligs.items():
        if closest_oblig_nr is None:
            closest_oblig_nr = oblig_nr
            continue

        latest_rettefrist = obligs[closest_oblig_nr]["rettefrist"]

        if oblig["rettefrist"] >= curr_date and oblig["rettefrist"] < latest_rettefrist:
            closest_oblig_nr = oblig_nr
else:
    if not args.oblig_nr in set(obligs.keys()):
        print("That oblig doesn't exist!")
        sys.exit(1)
    closest_oblig_nr = args.oblig_nr

this_oblig = obligs[closest_oblig_nr]

if (
    len((_difference := set(tasks_done).difference(set(this_oblig["problems"].keys()))))
    > 0
):
    print(f"Error! Not a valid oppgave: {_difference}")
    sys.exit(1)

oppgaver_text = ""
for number, title in this_oblig["problems"].items():
    if number in tasks_done:
        oppgaver_text += f"\n### Oppgave {number} - {title}\n\n+++\n"

quiz_tekst = "### **Quiz** - "
if quiz_done:
    quiz_tekst += "✅\n\n+++"
else:
    quiz_tekst += "Mangler ❌"

out = f"""
# Hei!

+++

## Tilbakemelding for oblig {closest_oblig_nr}

{quiz_tekst}
{oppgaver_text}
## Generelt

Godt jobba! Ta kontakt på skagel@uio.no eller Discourse hvis du lurer på noe. 


### **Bestått** - 🪇️🪇️

[]({this_oblig["gif_url"]})
"""

print(out)
