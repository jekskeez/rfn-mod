package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import flash.display.InteractiveObject;
   
   public class §_-N2o§ extends §_-A1f§ implements §_-22J§
   {
      
      protected static const §_-kI§:Number = 23.6;
      
      protected var §_-y19§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-a1d§:§_-d2d§;
      
      protected var §_-1k§:§_-d2d§;
      
      protected var §_-12§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-J1p§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-x2A§:Number = 0;
      
      protected var §_-71E§:Number = 0;
      
      protected var §_-A1a§:Number = 0;
      
      public function §_-N2o§(param1:Boolean = true)
      {
         super();
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
         this.§_-x2A§ = new this.middleClass().width;
         this.§_-71E§ = new this.leftClass().width;
         this.§_-A1a§ = new this.rightClass().width;
         this.§_-a1d§ = new §_-d2d§(new this.leftClass());
         this.§_-1k§ = new §_-d2d§(new this.rightClass());
         this.§_-a1d§.loop = true;
         this.§_-a1d§.play();
         this.§_-1k§.loop = true;
         this.§_-1k§.play();
         this.§_-y19§.§_-83v§(this.§_-12§);
         this.§_-y19§.§_-83v§(this.§_-a1d§);
         this.§_-y19§.§_-83v§(this.§_-1k§);
         this.§_-1k§.x = 0;
         §_-83v§(this.§_-y19§);
         if(param1)
         {
            this.draw();
         }
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2PolygonShape = null;
         var _loc3_:b2FixtureDef = null;
         if(!this.body)
         {
            this.body = param1.CreateBody(§_-E2n§);
            this.body.SetUserData(this);
            _loc2_ = b2PolygonShape.AsOrientedBox(this.§_-y19§.width * 0.5 / Game.§_-x2P§,§_-kI§ * 0.5 / Game.§_-x2P§,new b2Vec2(this.§_-y19§.width * 0.5 / Game.§_-x2P§,§_-kI§ * 0.5 / Game.§_-x2P§));
            _loc3_ = new b2FixtureDef(_loc2_,this,friction,restitution,density,this.categories,this.maskBits,0);
            this.body.CreateFixture(_loc3_);
         }
         super.build(param1);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function resize(param1:int, param2:int) : void
      {
         param2 = this.§_-O1v§;
         param1 = Math.max(int(param1 / this.§_-x2A§) * this.§_-x2A§,this.§_-71E§ + this.§_-A1a§);
         super.resize(param1,param2);
      }
      
      override protected function draw() : void
      {
         var _loc3_:§_-d2d§ = null;
         while(this.§_-J1p§.numChildren > 0)
         {
            this.§_-J1p§.§_-ek§(0).stop();
            this.§_-J1p§.§_-ek§(0).removeFromParent(true);
            this.§_-J1p§.§_-n2T§(0);
         }
         while(this.§_-12§.numChildren > 0)
         {
            this.§_-12§.§_-n2T§(0,true);
         }
         var _loc1_:int = Math.ceil((this._width - this.§_-71E§) / this.§_-x2A§) - 1;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = new §_-d2d§(new this.middleClass());
            _loc3_.loop = true;
            _loc3_.play();
            _loc3_.x = _loc2_ * this.§_-x2A§;
            this.§_-J1p§.§_-83v§(_loc3_);
            _loc2_++;
         }
         this.§_-J1p§.x = this.§_-71E§;
         if(Boolean(this.§_-J1p§.width) && Boolean(this.§_-J1p§.height))
         {
            this.§_-12§.§_-83v§(this.§_-J1p§);
         }
         this.§_-1k§.x = this.§_-J1p§.x + this.§_-J1p§.width;
         this.§_-R2H§();
      }
      
      protected function §_-R2H§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-y19§.numChildren)
         {
            if(this.§_-y19§.§_-ek§(_loc1_) is InteractiveObject)
            {
               (this.§_-y19§.§_-ek§(_loc1_) as InteractiveObject).doubleClickEnabled = true;
            }
            _loc1_++;
         }
      }
      
      protected function get leftClass() : Class
      {
         return null;
      }
      
      protected function get middleClass() : Class
      {
         return null;
      }
      
      protected function get rightClass() : Class
      {
         return null;
      }
      
      protected function get §_-O1v§() : Number
      {
         return §_-kI§;
      }
   }
}

