package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import game.mainGame.§_-3l§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-Wr§;
   
   public class §_-52m§ extends §_-aS§ implements §_-xn§, §_-3l§, §_-l2r§
   {
      
      protected var §_-i2w§:§_-aS§ = null;
      
      protected var §_-q14§:String = "";
      
      private var _toggle:Boolean = false;
      
      public function §_-52m§()
      {
         super();
         this.init();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
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
      
      public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.message];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         this.message = param1[2];
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         this.removeFromParent();
         if(this.§_-i2w§)
         {
            this.§_-i2w§.removeFromParent();
         }
         if(this.parentStarling)
         {
            this.removeFromParent();
         }
         this.§_-i2w§ = null;
      }
      
      public function get message() : String
      {
         return this.§_-q14§;
      }
      
      public function set message(param1:String) : void
      {
         if(this.§_-i2w§)
         {
            this.§_-i2w§.removeFromParent();
         }
         this.§_-q14§ = param1;
         if(!param1 || param1 == "")
         {
            return;
         }
         this.§_-i2w§ = new §_-aS§(new §_-Wr§(param1,this.toggle),true);
         this.§_-i2w§.x = -this.§_-i2w§.width - 21;
         this.§_-i2w§.y = -this.§_-i2w§.height + 26;
         §_-J2J§(this.§_-i2w§);
      }
      
      protected function init() : void
      {
         §_-J2J§(new §_-aS§(new HelperImage()));
      }
   }
}

