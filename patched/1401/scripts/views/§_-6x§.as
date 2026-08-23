package views
{
   import §_-T1r§.§_-43H§;
   import §_-T2y§.§_-92z§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-6x§ extends Sprite
   {
      
      private var §_-53q§:Sprite = null;
      
      private var §_-zF§:Sprite = null;
      
      private var §_-23g§:SimpleButton = null;
      
      private var §_-m16§:§_-22V§ = null;
      
      private var §_-Z1d§:§_-22V§ = null;
      
      private var §_-tz§:§_-22V§ = null;
      
      private var §_-23e§:Sprite = null;
      
      public function §_-6x§()
      {
         super();
         this.§_-h16§();
         this.§_-X1b§();
      }
      
      public function §_-62k§(param1:int) : void
      {
         this.show();
         this.§_-m16§.text = param1.toString();
      }
      
      public function §_-u2t§(param1:Array, param2:Array) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         this.show(true);
         this.§_-66§.set(param1,param2);
         this.§_-tz§.text = param2.length.toString();
         this.§_-Z1d§.text = param1.length.toString();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-66§.§_-21G§);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-66§.§_-21G§);
      }
      
      public function onRemove(param1:int) : void
      {
         if(!this.§_-zF§.visible)
         {
            return;
         }
         this.§_-66§.remove(param1);
         this.§_-tz§.text = String(this.§_-66§.§_-AB§);
         this.§_-Z1d§.text = String(this.§_-66§.§_-B2e§);
      }
      
      public function get §_-66§() : §_-43H§
      {
         if(!this.§_-23e§)
         {
            this.§_-23e§ = new §_-43H§();
            this.§_-23e§.x = -165;
            addChild(this.§_-23e§);
         }
         return this.§_-23e§ as §_-43H§;
      }
      
      public function hide() : void
      {
         if(this.§_-53q§)
         {
            this.§_-53q§.visible = false;
         }
         if(this.§_-zF§)
         {
            this.§_-zF§.visible = false;
         }
         if(!this.§_-23e§)
         {
            return;
         }
         this.§_-66§.hide();
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-66§.§_-21G§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-66§.§_-21G§);
      }
      
      public function show(param1:Boolean = false) : void
      {
         if(!param1 && !this.§_-53q§)
         {
            this.§_-h16§();
         }
         if(param1 && !this.§_-zF§)
         {
            this.§_-X1b§();
         }
         if(this.§_-53q§)
         {
            this.§_-53q§.visible = !param1;
         }
         if(this.§_-zF§)
         {
            this.§_-zF§.visible = param1;
         }
      }
      
      private function §_-h16§() : void
      {
         this.§_-53q§ = new Sprite();
         addChild(this.§_-53q§);
         this.§_-23g§ = new ButtonSquirrelCount();
         this.§_-23g§.x = 35;
         this.§_-23g§.y = 8;
         this.§_-23g§.addEventListener(MouseEvent.CLICK,this.§_-I2H§);
         this.§_-53q§.addChild(this.§_-23g§);
         this.§_-m16§ = new §_-22V§("",45,0,new TextFormat(null,13,16777215,true));
         this.§_-53q§.addChild(this.§_-m16§);
      }
      
      private function §_-X1b§() : void
      {
         this.§_-zF§ = new Sprite();
         addChild(this.§_-zF§);
         var _loc1_:SimpleButton = new BlueTeamCounterFlagImage();
         _loc1_.x = 20;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-d1t§);
         this.§_-zF§.addChild(_loc1_);
         _loc1_ = new RedTeamCounterFlagImage();
         _loc1_.x = 48;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-d1t§);
         this.§_-zF§.addChild(_loc1_);
         this.§_-tz§ = new §_-22V§("",35,0,new TextFormat(null,13,16777215,true));
         this.§_-zF§.addChild(this.§_-tz§);
         this.§_-Z1d§ = new §_-22V§("",63,0,new TextFormat(null,13,16777215,true));
         this.§_-zF§.addChild(this.§_-Z1d§);
      }
      
      private function §_-I2H§(param1:MouseEvent) : void
      {
         §_-92z§.§_-72R§();
      }
      
      private function §_-d1t§(param1:MouseEvent) : void
      {
         this.§_-66§.show();
         param1.stopImmediatePropagation();
      }
   }
}

