package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.§_-03u§;
   import game.mainGame.entity.§_-63Q§;
   import utils.§_-5l§;
   
   public class §_-M1M§ extends §_-h2I§ implements §_-63Q§, §_-03u§, §_-C2x§
   {
      
      protected var §_-N1I§:§_-h2I§ = null;
      
      protected var §_-13W§:String = "";
      
      private var _toggle:Boolean = false;
      
      public function §_-M1M§()
      {
         super();
         this.init();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      public function get angle() : Number
      {
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 / Game.D2R;
      }
      
      public function get toggle() : Boolean
      {
         return this._toggle;
      }
      
      public function set toggle(param1:Boolean) : void
      {
         this._toggle = param1;
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.message];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         this.message = param1[2];
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         this.removeFromParent();
         if(this.§_-N1I§)
         {
            this.§_-N1I§.removeFromParent();
         }
         if(this.parentStarling)
         {
            this.removeFromParent();
         }
         this.§_-N1I§ = null;
      }
      
      public function get message() : String
      {
         return this.§_-13W§;
      }
      
      public function set message(param1:String) : void
      {
         if(this.§_-N1I§)
         {
            this.§_-N1I§.removeFromParent();
         }
         this.§_-13W§ = param1;
         if(!param1 || param1 == "")
         {
            return;
         }
         this.§_-N1I§ = new §_-h2I§(new §_-5l§(param1,this.toggle),true);
         this.§_-N1I§.x = -this.§_-N1I§.width - 21;
         this.§_-N1I§.y = -this.§_-N1I§.height + 26;
         §_-83v§(this.§_-N1I§);
      }
      
      protected function init() : void
      {
         §_-83v§(new §_-h2I§(new HelperImage()));
      }
   }
}

