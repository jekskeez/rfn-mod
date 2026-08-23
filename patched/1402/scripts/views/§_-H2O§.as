package views
{
   import §_-c2C§.§_-u24§;
   import §_-cm§.§_-93g§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-H2O§ extends Sprite
   {
      
      private var §_-Px§:Sprite = null;
      
      private var §_-j1e§:Sprite = null;
      
      private var §_-C2t§:SimpleButton = null;
      
      private var §_-g1V§:§_-i5§ = null;
      
      private var §_-c1f§:§_-i5§ = null;
      
      private var §_-G1H§:§_-i5§ = null;
      
      private var §_-026§:Sprite = null;
      
      public function §_-H2O§()
      {
         super();
         this.§_-Bk§();
         this.§_-B3W§();
      }
      
      public function §_-yA§(param1:int) : void
      {
         this.show();
         this.§_-g1V§.text = param1.toString();
      }
      
      public function §_-RB§(param1:Array, param2:Array) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         this.show(true);
         this.§_-L2k§.set(param1,param2);
         this.§_-G1H§.text = param2.length.toString();
         this.§_-c1f§.text = param1.length.toString();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-L2k§.§_-r1i§);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-L2k§.§_-r1i§);
      }
      
      public function onRemove(param1:int) : void
      {
         if(!this.§_-j1e§.visible)
         {
            return;
         }
         this.§_-L2k§.remove(param1);
         this.§_-G1H§.text = String(this.§_-L2k§.§_-c27§);
         this.§_-c1f§.text = String(this.§_-L2k§.§_-E18§);
      }
      
      public function get §_-L2k§() : §_-93g§
      {
         if(!this.§_-026§)
         {
            this.§_-026§ = new §_-93g§();
            this.§_-026§.x = -165;
            addChild(this.§_-026§);
         }
         return this.§_-026§ as §_-93g§;
      }
      
      public function hide() : void
      {
         if(this.§_-Px§)
         {
            this.§_-Px§.visible = false;
         }
         if(this.§_-j1e§)
         {
            this.§_-j1e§.visible = false;
         }
         if(!this.§_-026§)
         {
            return;
         }
         this.§_-L2k§.hide();
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-L2k§.§_-r1i§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-L2k§.§_-r1i§);
      }
      
      public function show(param1:Boolean = false) : void
      {
         if(!param1 && !this.§_-Px§)
         {
            this.§_-Bk§();
         }
         if(param1 && !this.§_-j1e§)
         {
            this.§_-B3W§();
         }
         if(this.§_-Px§)
         {
            this.§_-Px§.visible = !param1;
         }
         if(this.§_-j1e§)
         {
            this.§_-j1e§.visible = param1;
         }
      }
      
      private function §_-Bk§() : void
      {
         this.§_-Px§ = new Sprite();
         addChild(this.§_-Px§);
         this.§_-C2t§ = new ButtonSquirrelCount();
         this.§_-C2t§.x = 35;
         this.§_-C2t§.y = 8;
         this.§_-C2t§.addEventListener(MouseEvent.CLICK,this.§_-CR§);
         this.§_-Px§.addChild(this.§_-C2t§);
         this.§_-g1V§ = new §_-i5§("",45,0,new TextFormat(null,13,16777215,true));
         this.§_-Px§.addChild(this.§_-g1V§);
      }
      
      private function §_-B3W§() : void
      {
         this.§_-j1e§ = new Sprite();
         addChild(this.§_-j1e§);
         var _loc1_:SimpleButton = new BlueTeamCounterFlagImage();
         _loc1_.x = 20;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-P1Q§);
         this.§_-j1e§.addChild(_loc1_);
         _loc1_ = new RedTeamCounterFlagImage();
         _loc1_.x = 48;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-P1Q§);
         this.§_-j1e§.addChild(_loc1_);
         this.§_-G1H§ = new §_-i5§("",35,0,new TextFormat(null,13,16777215,true));
         this.§_-j1e§.addChild(this.§_-G1H§);
         this.§_-c1f§ = new §_-i5§("",63,0,new TextFormat(null,13,16777215,true));
         this.§_-j1e§.addChild(this.§_-c1f§);
      }
      
      private function §_-CR§(param1:MouseEvent) : void
      {
         §_-u24§.§_-D4§();
      }
      
      private function §_-P1Q§(param1:MouseEvent) : void
      {
         this.§_-L2k§.show();
         param1.stopImmediatePropagation();
      }
   }
}

