package §_-d1P§
{
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import menu.§_-cD§;
   import utils.§_-33I§;
   import utils.§_-S1m§;
   
   public class §_-RU§ extends Dialog
   {
      
      private static const §_-v19§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,0);
      
      private static const §_-aD§:String = ["body{","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 13px;","color: #4A1901;","}","a {","text-decoration: none;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet;
      
      private var §_-8X§:§_-i5§;
      
      private var §_-c1h§:TextField;
      
      private var playerId:int;
      
      public function §_-RU§()
      {
         super(gls(§_a_-_---§.§_a_--_--§(-1820302795)));
         this.init();
         Game.listen(this.§_-Y16§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§,false,0,true);
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         addChild(new §_-i5§("ID:",0,5,§_-v19§));
         this.§_-c1h§ = new TextField();
         this.§_-c1h§.x = 20;
         this.§_-c1h§.y = 5;
         this.§_-c1h§.width = 100;
         this.§_-c1h§.height = 20;
         this.§_-c1h§.type = TextFieldType.INPUT;
         this.§_-c1h§.restrict = "[0-9]";
         this.§_-c1h§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,13,0,true);
         this.§_-c1h§.borderColor = 11776947;
         this.§_-c1h§.border = true;
         this.§_-c1h§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§,false,0,true);
         addChild(this.§_-c1h§);
         addChild(new §_-i5§(gls("Игрок:"),0,35,§_-v19§));
         this.§_-8X§ = new §_-i5§("",50,35,this.style);
         this.§_-8X§.addEventListener(MouseEvent.MOUSE_UP,this.§_-U2c§,false,0,true);
         addChild(this.§_-8X§);
         var _loc1_:§_-K2G§ = new §_-K2G§(gls("Запросить"));
         _loc1_.x = 50;
         _loc1_.y = 60;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-wV§,false,0,true);
         addChild(_loc1_);
         place();
         this.width = 250;
         this.height += 40;
      }
      
      private function §_-U2c§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
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
         if(param1.ctrlKey && !param1.shiftKey && param1.keyCode == Keyboard.S)
         {
            show();
         }
      }
      
      private function request() : void
      {
         this.playerId = int(this.§_-c1h§.text);
         Game.request(this.playerId,§_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.playerId)
         {
            return;
         }
         §_-S1m§.§_-hB§(this.§_-8X§,_loc2_,200,true,true,true);
      }
   }
}

