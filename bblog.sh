#!/bin/sh
#
#  AUTHOR= Stefano Viola (aka) Esteban Sannin
# CONTACT= stefanoviola[@]sannioglug[.]org
# LICENSE= GPLv3
#

VERSION=0.2.9

EDITOR=vi
INDEX=index.html
FORMAT=html
SEC=`date +%s`
PUBLISHED=[`date "+%d %m %Y - %R"`]
DIR=data
FOOTERTXT=user@bblog

TITLE_SITE=user@bblog~$

OUTPUT_TOP=post_top
MESSAGE=message_post
OUTPUT_BOT=post_bottom
POST_PUBLISHED=published
CONFIG=bblog.conf
DESTINATION_DIR=
THEME_DIR=themes/

THEME=default.css
MENU_CONF=config/menu.conf
#******** Remote Upload Parm *********#

FTP_HOST=estebansannin.altervista.org
FTP_LOGIN=estebansannin
FTP_REMOTE_DIR=/bblog

#******** END REMOTE FTP PARM ********#

#*********** MENU SETTING ************#

NAME_LINK1=`sed -n 1p $MENU_CONF | cut -f1 -d\;`
HREF_LINK1=`sed -n 1p $MENU_CONF | cut -f2 -d\;`

NAME_LINK2=`sed -n 2p $MENU_CONF | cut -f1 -d\;`
HREF_LINK2=`sed -n 2p $MENU_CONF | cut -f2 -d\;`

NAME_LINK3=`sed -n 3p $MENU_CONF | cut -f1 -d\;`
HREF_LINK3=`sed -n 3p $MENU_CONF | cut -f2 -d\;`

NAME_LINK4=`sed -n 4p $MENU_CONF | cut -f1 -d\;`
HREF_LINK4=`sed -n 4p $MENU_CONF | cut -f2 -d\;`

NAME_LINK5=`sed -n 5p $MENU_CONF | cut -f1 -d\;`
HREF_LINK5=`sed -n 5p $MENU_CONF | cut -f2 -d\;`

NAME_LINK6=`sed -n 6p $MENU_CONF | cut -f1 -d\;`
HREF_LINK6=`sed -n 6p $MENU_CONF | cut -f2 -d\;`

NAME_LINK7=`sed -n 7p $MENU_CONF | cut -f1 -d\;`
HREF_LINK7=`sed -n 7p $MENU_CONF | cut -f2 -d\;`

NAME_LINK8=`sed -n 8p $MENU_CONF | cut -f1 -d\;`
HREF_LINK8=`sed -n 8p $MENU_CONF | cut -f2 -d\;`

#********** END MENU SETTING *********#

# funzione che genera il link per la pagina principale
update_index(){
    echo "<!-- ;${SEC}; postblog--><br>${PUBLISHED}: <a href=\"${DIR}/${SEC}.$TITLE.${FORMAT}\">${title}</a>" >> ${INDEX}
}

# pagina del post blog

post_top(){
    echo "<!-- <?xml version=\"1.0\" encoding=\"UTF-8\" ?> --><!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><link rel=\"stylesheet\" href=\"$THEME_PAGE\" type=\"text/css\">"  >> ${FINAL}
    echo "<head><title>${TITLE} - ${DATE}</title></head>"  >> ${FINAL}
    echo "<body>"  >> ${FINAL}
    echo "<meta http-equiv=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">" >> ${FINAL}
    echo "<div id=\"footer\"><font color=red>  BBLOG</font> by <a href=\"http://esteban.homelinux.org\">EstebanSannin</a></div>" >> ${FINAL}
    echo "<div id=\"header\"><pre><titleSite><h2>$TITLE_SITE</h2></titleSite></pre>" >> ${FINAL}
    echo "<pre><table border=\"0\"><tr>" >> ${FINAL}
    echo "<td><a href='../$INDEX'><--- Return</a></td>" >> ${FINAL}
    echo "</tr></table></pre></div>" >> ${FINAL}
    echo "<div id=\"content\">" >> ${FINAL}
    echo "<h3>$title</h3>" >> ${FINAL}
    echo           >> ${FINAL}
}

post_bottom(){
    echo          >> ${FINAL}
    echo "<br>--<br>"     >> ${FINAL}
    echo "Posted by: ${FOOTERTXT}" >> ${FINAL}
    echo "</div>" >> ${FINAL}
    echo "</pre>" >>  ${FINAL}
    echo "</body>" >>  ${FINAL}
    echo "</html>" >>  ${FINAL}
} 

# fine creazione pagina post

message_post(){
    cat temp.$FORMAT >> ${FINAL}
    rm temp.*
}

format_main(){
    mkdir -p ${DESTINATION_DIR}${DIR} || echo ${DESTINATION_DIR}${DIR} exists...

    FINAL=${DESTINATION_DIR}$DIR/$SEC.$TITLE.$FORMAT
    ${OUTPUT_TOP} 
    ${MESSAGE}
    ${OUTPUT_BOT}
    echo $FINAL 
}


# genera la home se non esiste
home(){ 
    if [ ! -e ${INDEX} ]; then
	echo
	echo "...creating ${INDEX}"
	echo "<!-- ;99999999999; --><!-- <?xml version=\"1.0\" encoding=\"UTF-8\" ?> --><!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><link rel=\"stylesheet\" href=\"$THEME_CSS\" type=\"text/css\"><head><title>$TITLE_SITE</title></head><body>" >> ${INDEX}
	echo "<!-- ;9999999999; --><meta http-equiv=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">" >> ${INDEX}
	echo "<!-- ;9999999998; --><div id=\"footer\"><font color=red>  BBLOG</font> by <a href=\"http://esteban.homelinux.org\">EstebanSannin</a></div>" >> ${INDEX}
	echo "<!-- ;9999999997; --><div id=\"header\"><pre><titleSite><h2>$TITLE_SITE</h2></titleSite><table border=\"0\"><tr>" >> ${INDEX}
	echo "<!-- ;9999999995; --><td class=\"headitem\"><a href=\"$HREF_LINK1\"><link1>$NAME_LINK1</link1></a></td>" >> ${INDEX}
	echo "<!-- ;9999999994; --><td class=\"headitem\"><a href=\"$HREF_LINK2\"><link2>$NAME_LINK2</link2></a></td>" >> ${INDEX}
	echo "<!-- ;9999999993; --><td class=\"headitem\"><a href=\"$HREF_LINK3\"><link3>$NAME_LINK3</link3></a></td>" >> ${INDEX}
	echo "<!-- ;9999999992; --><td class=\"headitem\"><a href=\"$HREF_LINK4\"><link4>$NAME_LINK4</link4></a></td>" >> ${INDEX}
	echo "<!-- ;9999999990; --><td class=\"headitem\"><a href=\"$HREF_LINK5\"><link5>$NAME_LINK5</link5></a></td>" >> ${INDEX}
	echo "<!-- ;9999999989; --><td class=\"headitem\"><a href=\"$HREF_LINK6\"><link6>$NAME_LINK6</link6></a></td>" >> ${INDEX}
	echo "<!-- ;9999999988; --><td class=\"headitem\"><a href=\"$HREF_LINK7\"><link7>$NAME_LINK7</link7></a></td>" >> ${INDEX}
	echo "<!-- ;9999999987; --><td class=\"headitem\"><a href=\"$HREF_LINK8\"><link8>$NAME_LINK8</link8></a></td>" >> ${INDEX}
	echo "<!-- ;9999999980; --></tr></table></div>" >> ${INDEX}
	#end menu bar

	echo "<!-- ;9999999979; --><div id=\"content\">" >> ${INDEX}
	echo "<!-- ;9999999978; --><h3>Post List:</h3>" >> ${INDEX}
	echo "<!-- ;4; enter content -->" >> ${INDEX}
	echo "<!-- ;3; enter content -->" >> ${INDEX}
	echo "<!-- ;2; enter content -->" >> ${INDEX}
	echo "<!-- ;0; closing tag --></body></html>" >> ${INDEX}
	echo
   fi
}


get_post_title(){
    echo 
    echo -n "Insert Post Title: "
    read title
    TITLE=`echo $title | sed 's/ /-/g'`
}
read_config(){

    if [ -e config/$CONFIG  ]; then
	. config/$CONFIG
	echo -n "\n\tLoaded configuration file: $CONFIG\n\n"
    else
	echo -n "\n\n\tConfiguration file not loaded!\n\n"
    fi
}

sort_index(){

	sort -t';' +0f -0 +1nr ${INDEX} > ${INDEX}.$$.sorted
	mv ${INDEX}.$$.sorted ${INDEX}
}

move_content(){

    cp $INDEX $DESTINATION_DIR
    cp -r $THEME_DIR $DESTINATION_DIR
    cp -r $DIR $DESTINATION_DIR

}
move(){
    echo -n "Insert Path Directory: "
    read dir
    DESTINATION_DIR=$dir
    if [ -e $DESTINATION_DIR  ]; then
#echo "il file esiste"
	move_content
#echo "Content moved to: $DESTINATION_DIR"
	echo
    else
	echo "Directory not exist. Do you want create one? (y/n)"
	read chose
	if [ $chose = "y" ]; then
	    mkdir $DESTINATION_DIR
	    move_content
	    echo
	else if [ $chose = n  ]; then
	    echo "Content not moved!"
	else
	    echo "Error input!"
	fi
    fi
    fi
}

log_post(){
#read_config
    cat ${INDEX} | grep post | cut -f2 -d\" > temp_post
    sed -i 's% %\\ %g' temp_post
}

list_post_published(){
    log_post
    echo -n "\n\n\tList of number Post:\n\n"
    cat -b temp_post
    echo -n "\n\n"
}

modify_post(){
    log_post
    list_post_published
    echo -n "Insert the number of posts you want to change: "
    read number
    number_post=`wc -l temp_post | awk {'print $1'}`
    echo "number: $number"
    if [ ! -z "$number" ]; then
	if [ "$number" -gt "$number_post" ]; then
	    echo
	    echo "The number of posts you entered is invalid!"
	    list_post_published
	else
	    blog_post=`sed -n ${number}p temp_post`
	    echo $blog_post
	    $EDITOR `echo $blog_post`
	fi
    else
	echo "No number entered!"
	echo
    fi
}

post_list(){
    echo -n "\n\n\tPost LIST:\n\n"
    ls -1 -r $DIR
    echo
}

delete_post(){
    echo "Delete posts"
    list_post_published
    echo -n "Insert the number of posts you want to delete: "
    read number
    number_post=`wc -l temp_post | awk {'print $1'}`
    echo "number: $number"

    if [ ! -z "$number" ]; then
	if [ "$number" -gt "$number_post" ]; then
	    echo
	    echo "The number of posts you entered is invalid!"
	    list_post_published
	else
	    temporary_value_post=`sed -n ${number}p temp_post | awk -F. {'print $1'} | cut -f2 -d/`
#search_post=`cat index.html | grep "$temporary_value_post" `
#echo $temporary_value_post
	    echo $temporary_value_post
	    echo "Confirm (y/n)"
	    read confirm
	    case "$confirm" in
		y)
			sed -i "/$temporary_value_post/d" $INDEX
			echo "Post Deleted!"
			echo
			;;
		*)
			echo "Annulled"
			echo
			;;
			esac			
	
	  fi
		else
			echo "No number entered!"
			echo
	fi

}

change_theme(){

    echo "*****CHANGE THEME*****"
    echo ""
    echo "List themes installed:"
    cat -b themes/log_theme
    echo "Current theme:"
    current=`cat themes/current_theme`
    echo "---> $current"
    echo ""
    echo "Insert the number of the theme change:"
    read number
    number_theme=`wc -l themes/log_theme | awk {'print $1'}`
    if [ ! -z "$number" ]; then
	if [ "$number" -gt "$number_theme" ]; then
	    echo
	    echo "The number of posts you entered is invalid!"
	    cat -b themes/log_theme
	else
	    name_theme=`cat -b themes/log_theme | grep $number | awk {'print $2'}`
	    echo $name_theme
	    `sed -i "s;themes/$current;themes/$name_theme;" *.html`
	    sed -i "s;themes/$current;themes/$name_theme;g" `cat temp_post`
	    `echo $name_theme > themes/current_theme`
	fi
    else
	echo Error!!
    fi
}



change_title(){

	echo "Change Title site"
	echo ""
	echo "Current:"
	curret_title=`cat $CONFIG | grep TITLE_SITE | cut -f2 -d\"`
	echo $curret_title
	echo ""
	echo "Insert new Title Page"
	read new_title
	`sed -i "s;titleSite><h2>$curret_title;titleSite><h2>$new_title;g" *.html`
	sed -i "s;titleSite><h2>$curret_title;titleSite><h2>$new_title;g" `cat temp_post`
	sed -i "s;TITLE_SITE=\"$curret_title\";TITLE_SITE=\"$new_title\";g" $CONFIG

}

menu_administration(){
	echo "---> Menu Administration"
	echo
	echo
	current_number_link=`wc -l config/menu.conf | awk '{print $1}'`


	if [ $current_number_link -eq 8 ]; then
	echo "The current number link is 8"
	else
	echo "The number of the menu link is $current_number_link"
	echo "For add a new link menu insert the number $current_number_link + 1"
	echo "For modify existing menu insert the relative number"
	fi
	echo
	echo -n "Insert number link to modify: "
	read number
	if [ $number -gt 8 ]; then
	echo "Invalid number! The limit is 8"
	else
	p=p
	control=$number$p
	current=`sed -n $control $MENU_CONF | cut -f1 -d\;`
	if [ -z "$current" ]; then
		echo
		echo "Label not found!"
		echo "Do you want add a new link menu?"
		echo "---> yes"
		echo "---> no"
		read response
		case "$response" in
		yes)
		echo "Insert new label"
		read label
		echo "Insert new link"
		read link
		separator=\;
		echo "$label$separator$link" >> $MENU_CONF
		new_label=`sed -n $control $MENU_CONF | cut -f1 -d\;`
		new_link=`sed -n $control $MENU_CONF | cut -f2 -d\;`
		sed -i "s;<link$number>;<link$number>$new_label;g" *.html
		sed -i "s;<a href=\"\"><link$number>;<a href=\"$new_link\"><link$number>;g" *.html
		;;
		no)
		echo "Link not created"
		;;
		*)
		echo error!
		esac
	else
		#cat ${INDEX} | grep -i "<link$number>"
		echo "1. Change label"
		echo "2. Change link"
		echo "3. Delete menu link"
		read chois
		case "$chois" in
			1)
			echo "Current label is: `cat index.html | grep link$number | sed 's/<[^>]*[>]//g'`"
			current=`cat index.html | grep link$number | sed 's/<[^>]*[>]//g'`
			echo "Insert new label name:"
			read label
			sed -i "s;$current;$label;g" $MENU_CONF
			sed -i "s;<link$number>$attual;<link$number>$label;g" *.html
			;;
			2)
			echo "Insert new link for label: $current"
			read link
			current_link=`sed -n $control $MENU_CONF | cut -f2 -d\;`
			sed -i "s;$current_link;$link;g" $MENU_CONF
			sed -i "s;<a href=\"$current_link\"><link$number>;<a href=\"$link\"><link$number>;g" *.html
			;;
			3)
			echo delete
			;;
			*)
			echo "error!"
		esac
	fi
	fi
	
}
version(){
    echo -n "

	BBLOG $VERSION 

	Copyright © 2010 Stafano Viola
	Licenza GPLv3+: GNU GPL versione 3 o successive <http://gnu.org/licenses/gpl.html>
	Questo è software libero: siete liberi di modificarlo e ridistribuirlo.
	Non c'è ALCUNA GARANZIA, per quanto consentito dalle vigenti normative.
    \n"

}
usage(){
    echo -n "
    BBLOG Command:

    post      add new post blog
    edit      edit your blog post
    delete    delete your blog post
    page      creates a new html page
    theme     change your theme
    version   print Version
    help      This message
    title     change title Site
    list      a list of post
    info      information of bblog
    version   version note
    menu      setting menu bar
    exit      exit of bblog
    "
    echo ""
}

info(){
	echo
	echo "Current Theme: $STYLE"
	echo "Title Site:    $TITLE_SITE"
	echo "Page name:     $INDEX"
	echo

}
###################################### *** MAIN *** ########################################
#echo 
#echo "******************************************************"
#echo
read_config  # Importa i parametri da bblog.conf

######**  Setting Theme  **######

STYLE=`cat themes/current_theme` 
THEME_PAGE=../themes/$STYLE
THEME_CSS=themes/$STYLE

######**End Setting Theme**######



#echo -n "\n\n\tInformation Setting:\n\n"
#echo "THEME used: $STYLE"
#echo "TITLE_SITE: $TITLE_SITE"
#echo "PAGE NAME:  $INDEX"
#echo
#echo "******************************************************"
#echo
echo
echo "BBLOG"
echo
while [ 1 ]
do
echo -n "bblog> "
read value
case "$value" in
    test)
    echo insert
    read ue
    if [ $ue -gt 8 ]; then
    echo 11111
    else
    echo 222222
    fi
	;;
    init)
	home
    	;;
      ls)
      	ls .
	;;
    post)
	if [ -e $INDEX ]; then
		get_post_title
		echo $title
		$EDITOR temp.$FORMAT
		format_main
		home
		update_index
		sort_index
		echo "New Post Added to $INDEX!"
		echo
		log_post
	else
		echo "Index not present. Try \"init\"."
	fi
#echo $TITLE >> $POST_PUBLISHED
	
	;;
    list)
    	if [ -e $INDEX ]; then
    		echo -n "\n\n\tPost LIST:\n\n"
		ls -1 -r $DIR
		echo
	else
		echo "Index not found! Try \"init\"."
	fi

	;;
    
    list-pub)
    	if [ -e $INDEX ]; then
		list_post_published
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
    
    config)
	echo "configure"
	cat bblog.conf
	;;
    edit)
	if [ -e $INDEX ]; then
		echo "edit"
		modify_post
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
    info)
	info
	;;
    theme) 
    	if [ -e $INDEX ]; then
		change_theme
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
    move)
    	if [ -e $INDEX ]; then
		move
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
 version) 
    	version
	;;
    delete)
    	if [ -e $INDEX ]; then
		delete_post
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
    help)
	usage
	;;
    page)
    	if [ -e $INDEX ]; then
		echo "Insert title page"
		read title_page
		INDEX=$title_page.html 
		home
		sed -i "s%Post List:%TITLE%g" $INDEX
		echo "Page $INDEX created!"
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
   title)
   	if [ -e $INDEX ]; then
   		change_title
	else
		echo "Index not found! Try \"init\"."
	fi
   	;;
    menu)
    	if [ -e $INDEX ]; then
    		menu_administration
	else
		echo "Index not found! Try \"init\"."
	fi
	;;
    exit)
      	break
	;;
       *) 
	#usage
	echo "Error Syntax: $value "
	echo "Try \"help\" for more information."
	;;
esac
done



########## END ######################
