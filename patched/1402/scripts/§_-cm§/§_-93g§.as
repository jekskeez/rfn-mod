package §_-cm§
{
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-cA§.§_-03k§;
   import §_-cA§.§_-3§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import menu.§_-cD§;
   
   public class §_-93g§ extends Sprite
   {
      
      private static const §_-92s§:int = 17;
      
      private static const §_-M1f§:int = 33;
      
      private static const §_-aD§:String = [".default {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","}","a {","font-size: 11px;","text-decoration: underline;","}",".bold {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var background:BattlePlayersListImage = new BattlePlayersListImage();
      
      private var §_-6Y§:Sprite = new Sprite();
      
      private var §_-Bp§:Sprite = new Sprite();
      
      private var §_-hm§:RedStripeImage = null;
      
      private var §_-u2S§:BlueStripeImage = null;
      
      private var textField:§_-i5§ = null;
      
      private var §_-51C§:§_-3§ = null;
      
      private var §_-rv§:§_-3§ = null;
      
      private var §_-lA§:Boolean = false;
      
      public function §_-93g§()
      {
         super();
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.graphics.beginFill(0,0);
         this.graphics.drawRect(0,0,480,§_-M1f§ + 5 + 100);
         this.graphics.endFill();
         this.y = -7;
         this.background.width = 350;
         this.background.y = §_-M1f§;
         addChild(this.background);
         this.textField = new §_-i5§("",3,41,this.style);
         addChild(this.textField);
         this.§_-6Y§.addChild(new §_-i5§(gls("Красные:"),-4,0,new TextFormat(§_-i5§.§_-c10§,11,12387328,true)));
         this.§_-51C§ = new §_-3§(Hero.§_-l1B§);
         var _loc1_:§_-03k§ = new §_-03k§();
         _loc1_.x = 9;
         _loc1_.y = 17;
         _loc1_.setData(this.§_-51C§);
         this.§_-6Y§.addChild(_loc1_);
         this.§_-hm§ = new RedStripeImage();
         this.§_-hm§.y = 17;
         this.§_-6Y§.addChild(this.§_-hm§);
         this.§_-6Y§.x = 180;
         this.§_-6Y§.y = §_-M1f§ + 25;
         addChild(this.§_-6Y§);
         this.§_-Bp§.addChild(new §_-i5§(gls("Синие:"),-4,0,new TextFormat(§_-i5§.§_-c10§,11,1264039,true)));
         this.§_-rv§ = new §_-3§();
         var _loc2_:§_-03k§ = new §_-03k§();
         _loc2_.x = 9;
         _loc2_.y = 16;
         _loc2_.setData(this.§_-rv§);
         this.§_-Bp§.addChild(_loc2_);
         this.§_-u2S§ = new BlueStripeImage();
         this.§_-u2S§.y = 16;
         this.§_-Bp§.addChild(this.§_-u2S§);
         this.§_-Bp§.x = 7;
         this.§_-Bp§.y = §_-M1f§ + 25;
         addChild(this.§_-Bp§);
         this.visible = false;
         addEventListener(MouseEvent.ROLL_OVER,this.§_-T2H§);
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-X17§);
      }
      
      public function get §_-E18§() : int
      {
         return this.§_-51C§.count;
      }
      
      public function get §_-c27§() : int
      {
         return this.§_-rv§.count;
      }
      
      public function §_-o2y§(param1:Array) : void
      {
         var _loc2_:Array = null;
         for each(_loc2_ in param1)
         {
            if(§_-u24§.§_-bL§(_loc2_[0]))
            {
               this.§_-rv§.§_-v2N§(_loc2_[0],_loc2_[1]);
               this.§_-51C§.§_-v2N§(_loc2_[0],_loc2_[1]);
            }
         }
      }
      
      public function set(param1:Array, param2:Array) : void
      {
         this.§_-51C§.§_-v1d§(param1);
         this.§_-rv§.§_-v1d§(param2);
         this.§_-ZU§();
      }
      
      public function add(param1:int) : void
      {
         this.§_-51C§.§_-Fg§(param1);
         this.§_-ZU§();
      }
      
      public function remove(param1:int) : void
      {
         this.§_-51C§.§_-9E§(param1);
         this.§_-rv§.§_-9E§(param1);
         this.§_-ZU§();
      }
      
      public function §_-a1r§(param1:int) : void
      {
         this.textField.text = gls("<span class=\'bold\'>Карта № </span><span class=\'default\'>{0}</span>",param1);
      }
      
      public function show() : void
      {
         this.visible = true;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
      }
      
      public function hide(param1:Event = null) : void
      {
         if(§_-cD§.§_-41k§())
         {
            return;
         }
         this.visible = false;
         removeEventListener(MouseEvent.ROLL_OUT,this.hide);
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
      }
      
      public function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.TAB)
         {
            return;
         }
         if(!this.§_-lA§ && param1.type == KeyboardEvent.KEY_DOWN)
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
         this.§_-lA§ = param1.type != KeyboardEvent.KEY_UP;
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         addEventListener(MouseEvent.ROLL_OUT,this.hide);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         if(param1.target is §_-i5§)
         {
            return;
         }
         if(param1.target == this)
         {
            return;
         }
         this.hide();
      }
      
      private function §_-X17§(param1:ScreenEvent) : void
      {
         this.hide();
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-r1i§);
      }
      
      private function §_-ZU§() : void
      {
         this.§_-hm§.height = this.§_-E18§ * §_-92s§;
         this.§_-u2S§.height = this.§_-c27§ * §_-92s§;
         this.background.height = this.§_-Bp§.y + Math.max(this.§_-hm§.height,this.§_-u2S§.height) - §_-M1f§ + 24;
      }
   }
}

