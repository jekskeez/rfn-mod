package §_-T1r§
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-X1o§.§_-u1R§;
   import §_-X1o§.§_-ut§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import menu.§_-927§;
   
   public class §_-43H§ extends Sprite
   {
      
      private static const §_-L1D§:int = 17;
      
      private static const §_-533§:int = 33;
      
      private static const §_-I2U§:String = [".default {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","}","a {","font-size: 11px;","text-decoration: underline;","}",".bold {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var background:BattlePlayersListImage = new BattlePlayersListImage();
      
      private var §_-CR§:Sprite = new Sprite();
      
      private var §_-L26§:Sprite = new Sprite();
      
      private var §_-13§:RedStripeImage = null;
      
      private var §_-N2A§:BlueStripeImage = null;
      
      private var textField:§_-22V§ = null;
      
      private var §_-610§:§_-ut§ = null;
      
      private var §_-037§:§_-ut§ = null;
      
      private var §_-M2G§:Boolean = false;
      
      public function §_-43H§()
      {
         super();
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.graphics.beginFill(0,0);
         this.graphics.drawRect(0,0,480,§_-533§ + 5 + 100);
         this.graphics.endFill();
         this.y = -7;
         this.background.width = 350;
         this.background.y = §_-533§;
         addChild(this.background);
         this.textField = new §_-22V§("",3,41,this.style);
         addChild(this.textField);
         this.§_-CR§.addChild(new §_-22V§(gls("Красные:"),-4,0,new TextFormat(§_-22V§.§_-F2z§,11,12387328,true)));
         this.§_-610§ = new §_-ut§(Hero.§_-17§);
         var _loc1_:§_-u1R§ = new §_-u1R§();
         _loc1_.x = 9;
         _loc1_.y = 17;
         _loc1_.setData(this.§_-610§);
         this.§_-CR§.addChild(_loc1_);
         this.§_-13§ = new RedStripeImage();
         this.§_-13§.y = 17;
         this.§_-CR§.addChild(this.§_-13§);
         this.§_-CR§.x = 180;
         this.§_-CR§.y = §_-533§ + 25;
         addChild(this.§_-CR§);
         this.§_-L26§.addChild(new §_-22V§(gls("Синие:"),-4,0,new TextFormat(§_-22V§.§_-F2z§,11,1264039,true)));
         this.§_-037§ = new §_-ut§();
         var _loc2_:§_-u1R§ = new §_-u1R§();
         _loc2_.x = 9;
         _loc2_.y = 16;
         _loc2_.setData(this.§_-037§);
         this.§_-L26§.addChild(_loc2_);
         this.§_-N2A§ = new BlueStripeImage();
         this.§_-N2A§.y = 16;
         this.§_-L26§.addChild(this.§_-N2A§);
         this.§_-L26§.x = 7;
         this.§_-L26§.y = §_-533§ + 25;
         addChild(this.§_-L26§);
         this.visible = false;
         addEventListener(MouseEvent.ROLL_OVER,this.§_-Q20§);
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-81C§);
      }
      
      public function get §_-B2e§() : int
      {
         return this.§_-610§.count;
      }
      
      public function get §_-AB§() : int
      {
         return this.§_-037§.count;
      }
      
      public function §_-I1K§(param1:Array) : void
      {
         var _loc2_:Array = null;
         for each(_loc2_ in param1)
         {
            if(§_-92z§.§_-O21§(_loc2_[0]))
            {
               this.§_-037§.§_-n1i§(_loc2_[0],_loc2_[1]);
               this.§_-610§.§_-n1i§(_loc2_[0],_loc2_[1]);
            }
         }
      }
      
      public function set(param1:Array, param2:Array) : void
      {
         this.§_-610§.§_-S2z§(param1);
         this.§_-037§.§_-S2z§(param2);
         this.§_-l13§();
      }
      
      public function add(param1:int) : void
      {
         this.§_-610§.§_-73o§(param1);
         this.§_-l13§();
      }
      
      public function remove(param1:int) : void
      {
         this.§_-610§.§_-I2W§(param1);
         this.§_-037§.§_-I2W§(param1);
         this.§_-l13§();
      }
      
      public function §_-t9§(param1:int) : void
      {
         this.textField.text = gls("<span class=\'bold\'>Карта № </span><span class=\'default\'>{0}</span>",param1);
      }
      
      public function show() : void
      {
         this.visible = true;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
      }
      
      public function hide(param1:Event = null) : void
      {
         if(§_-927§.§_-P21§())
         {
            return;
         }
         this.visible = false;
         removeEventListener(MouseEvent.ROLL_OUT,this.hide);
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
      }
      
      public function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.TAB)
         {
            return;
         }
         if(!this.§_-M2G§ && param1.type == KeyboardEvent.KEY_DOWN)
         {
            if(this.visible)
            {
               this.hide();
            }
            else
            {
               this.show();
            }
         }
         this.§_-M2G§ = param1.type != KeyboardEvent.KEY_UP;
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         addEventListener(MouseEvent.ROLL_OUT,this.hide);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         if(param1.target is §_-22V§)
         {
            return;
         }
         if(param1.target == this)
         {
            return;
         }
         this.hide();
      }
      
      private function §_-81C§(param1:ScreenEvent) : void
      {
         this.hide();
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-21G§);
      }
      
      private function §_-l13§() : void
      {
         this.§_-13§.height = this.§_-B2e§ * §_-L1D§;
         this.§_-N2A§.height = this.§_-AB§ * §_-L1D§;
         this.background.height = this.§_-L26§.y + Math.max(this.§_-13§.height,this.§_-N2A§.height) - §_-533§ + 24;
      }
   }
}

