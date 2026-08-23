package §_-d1P§
{
   import §_-I18§.§_-Tw§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import events.§_-a1V§;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import utils.§_-33I§;
   import utils.§_-L2J§;
   import views.§_-SZ§;
   
   public class §_-IW§ extends Dialog
   {
      
      private static const §_-v19§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,0);
      
      private static const §_-aD§:String = ["body{","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 13px;","color: #4A1901;","}","a {","text-decoration: none;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet;
      
      private var §_-E2W§:§_-i5§;
      
      private var §_-O1r§:TextField;
      
      private var clanEmblem:§_-SZ§;
      
      private var clanId:int;
      
      public function §_-IW§()
      {
         super(gls(§_a_-_---§.§_a_--_--§(-1820302797)));
         this.init();
         §_-B2U§.listen(this.onClanLoaded);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§,false,0,true);
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         addChild(new §_-i5§("ID:",0,5,§_-v19§));
         this.§_-O1r§ = new TextField();
         this.§_-O1r§.x = 20;
         this.§_-O1r§.y = 5;
         this.§_-O1r§.width = 100;
         this.§_-O1r§.height = 20;
         this.§_-O1r§.type = TextFieldType.INPUT;
         this.§_-O1r§.restrict = "[0-9]";
         this.§_-O1r§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,13,0,true);
         this.§_-O1r§.borderColor = 11776947;
         this.§_-O1r§.border = true;
         this.§_-O1r§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         addChild(this.§_-O1r§);
         addChild(new §_-i5§(gls("Клан:"),0,35,§_-v19§));
         this.§_-E2W§ = new §_-i5§("",50,35,this.style);
         this.§_-E2W§.addEventListener(MouseEvent.MOUSE_UP,this.§_-s2s§);
         addChild(this.§_-E2W§);
         this.clanEmblem = new §_-SZ§("",50,40);
         this.clanEmblem.visible = false;
         addChild(this.clanEmblem);
         var _loc1_:§_-K2G§ = new §_-K2G§(gls("Запросить"));
         _loc1_.x = 50;
         _loc1_.y = 60;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-wV§);
         addChild(_loc1_);
         place();
         this.width = 250;
         this.height += 40;
      }
      
      private function §_-s2s§(param1:MouseEvent) : void
      {
         §_-Tw§.show(this.clanId);
      }
      
      private function §_-wV§(param1:MouseEvent) : void
      {
         this.request();
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.request();
      }
      
      private function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(!param1 || !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
         }
         if(param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.S)
         {
            show();
         }
      }
      
      private function request() : void
      {
         this.clanId = int(this.§_-O1r§.text);
         §_-B2U§.request(this.clanId,§_-eT§.ALL,true);
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         §_-L2J§.§_-CS§(this.§_-E2W§,_loc2_.name != "" ? _loc2_.name : "undefined",200,true,true,_loc2_.id);
         var _loc3_:Rectangle = this.§_-E2W§.getCharBoundaries(0);
         this.clanEmblem.visible = true;
         this.clanEmblem.x = _loc3_.x + this.§_-E2W§.x - 12;
         this.clanEmblem.load(_loc2_.§_-o1p§);
      }
   }
}

