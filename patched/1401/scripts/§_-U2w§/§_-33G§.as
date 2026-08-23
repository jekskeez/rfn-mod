package §_-U2w§
{
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import menu.§_-927§;
   import utils.§_-Y1S§;
   import utils.§_-c10§;
   
   public class §_-33G§ extends Dialog
   {
      
      private static const §_-n1v§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0);
      
      private static const §_-I2U§:String = ["body{","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 13px;","color: #4A1901;","}","a {","text-decoration: none;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var style:StyleSheet;
      
      private var §_-fx§:§_-22V§;
      
      private var §_-h1m§:TextField;
      
      private var playerId:int;
      
      public function §_-33G§()
      {
         super(gls(§_a_-_---§.§_a_--_--§(-1820302795)));
         this.init();
         Game.listen(this.§_-P9§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§,false,0,true);
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         addChild(new §_-22V§("ID:",0,5,§_-n1v§));
         this.§_-h1m§ = new TextField();
         this.§_-h1m§.x = 20;
         this.§_-h1m§.y = 5;
         this.§_-h1m§.width = 100;
         this.§_-h1m§.height = 20;
         this.§_-h1m§.type = TextFieldType.INPUT;
         this.§_-h1m§.restrict = "[0-9]";
         this.§_-h1m§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0,true);
         this.§_-h1m§.borderColor = 11776947;
         this.§_-h1m§.border = true;
         this.§_-h1m§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§,false,0,true);
         addChild(this.§_-h1m§);
         addChild(new §_-22V§(gls("Игрок:"),0,35,§_-n1v§));
         this.§_-fx§ = new §_-22V§("",50,35,this.style);
         this.§_-fx§.addEventListener(MouseEvent.MOUSE_UP,this.§_-D1N§,false,0,true);
         addChild(this.§_-fx§);
         var _loc1_:§_-j18§ = new §_-j18§(gls("Запросить"));
         _loc1_.x = 50;
         _loc1_.y = 60;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-023§,false,0,true);
         addChild(_loc1_);
         place();
         this.width = 250;
         this.height += 40;
      }
      
      private function §_-D1N§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
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
         if(param1.ctrlKey && !param1.shiftKey && param1.keyCode == Keyboard.S)
         {
            show();
         }
      }
      
      private function request() : void
      {
         this.playerId = int(this.§_-h1m§.text);
         Game.request(this.playerId,§_-hF§.§_-31q§ | §_-hF§.§_-k2y§);
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.playerId)
         {
            return;
         }
         §_-Y1S§.§_-uc§(this.§_-fx§,_loc2_,200,true,true,true);
      }
   }
}

