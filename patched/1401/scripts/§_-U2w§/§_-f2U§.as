package §_-U2w§
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import §_-xm§.§_-n1a§;
   import buttons.§_-j18§;
   import events.§_-n13§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import utils.§_-c10§;
   import utils.§_-vo§;
   import views.§_-Z2N§;
   
   public class §_-f2U§ extends Dialog
   {
      
      private static const §_-n1v§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0);
      
      private static const §_-I2U§:String = ["body{","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 13px;","color: #4A1901;","}","a {","text-decoration: none;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet;
      
      private var §_-A2L§:§_-22V§;
      
      private var §_-z23§:TextField;
      
      private var clanEmblem:§_-Z2N§;
      
      private var clanId:int;
      
      public function §_-f2U§()
      {
         super(gls(§_a_-_---§.§_a_--_--§(-1820302797)));
         this.init();
         §_-e2W§.listen(this.onClanLoaded);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§,false,0,true);
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         addChild(new §_-22V§("ID:",0,5,§_-n1v§));
         this.§_-z23§ = new TextField();
         this.§_-z23§.x = 20;
         this.§_-z23§.y = 5;
         this.§_-z23§.width = 100;
         this.§_-z23§.height = 20;
         this.§_-z23§.type = TextFieldType.INPUT;
         this.§_-z23§.restrict = "[0-9]";
         this.§_-z23§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0,true);
         this.§_-z23§.borderColor = 11776947;
         this.§_-z23§.border = true;
         this.§_-z23§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         addChild(this.§_-z23§);
         addChild(new §_-22V§(gls("Клан:"),0,35,§_-n1v§));
         this.§_-A2L§ = new §_-22V§("",50,35,this.style);
         this.§_-A2L§.addEventListener(MouseEvent.MOUSE_UP,this.§_-YK§);
         addChild(this.§_-A2L§);
         this.clanEmblem = new §_-Z2N§("",50,40);
         this.clanEmblem.visible = false;
         addChild(this.clanEmblem);
         var _loc1_:§_-j18§ = new §_-j18§(gls("Запросить"));
         _loc1_.x = 50;
         _loc1_.y = 60;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-023§);
         addChild(_loc1_);
         place();
         this.width = 250;
         this.height += 40;
      }
      
      private function §_-YK§(param1:MouseEvent) : void
      {
         §_-n1a§.show(this.clanId);
      }
      
      private function §_-023§(param1:MouseEvent) : void
      {
         this.request();
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.request();
      }
      
      private function §_-21G§(param1:KeyboardEvent) : void
      {
         if(!param1 || !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
         }
         if(param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.S)
         {
            show();
         }
      }
      
      private function request() : void
      {
         this.clanId = int(this.§_-z23§.text);
         §_-e2W§.request(this.clanId,§_-Oy§.ALL,true);
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         §_-vo§.§_-A2B§(this.§_-A2L§,_loc2_.name != "" ? _loc2_.name : "undefined",200,true,true,_loc2_.id);
         var _loc3_:Rectangle = this.§_-A2L§.getCharBoundaries(0);
         this.clanEmblem.visible = true;
         this.clanEmblem.x = _loc3_.x + this.§_-A2L§.x - 12;
         this.clanEmblem.load(_loc2_.§_-M24§);
      }
   }
}

