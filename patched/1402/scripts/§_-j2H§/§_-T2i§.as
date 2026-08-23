package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-j4§.§_-Pn§;
   import flash.display.InteractiveObject;
   
   public class §_-T2i§ extends §_-01b§ implements §_-Pn§
   {
      
      protected static const §_-i2u§:Number = 23.6;
      
      protected var §_-f2Y§:§_-aS§ = new §_-aS§();
      
      protected var §_-72Y§:§_-f1u§;
      
      protected var §_-j2g§:§_-f1u§;
      
      protected var §_-N2D§:§_-aS§ = new §_-aS§();
      
      protected var §_-56§:§_-aS§ = new §_-aS§();
      
      protected var §_-a2S§:Number = 0;
      
      protected var §_-J1Q§:Number = 0;
      
      protected var §_-Py§:Number = 0;
      
      public function §_-T2i§(param1:Boolean = true)
      {
         super();
         while(numChildren > 0)
         {
            §_-av§(0);
         }
         this.§_-a2S§ = new this.middleClass().width;
         this.§_-J1Q§ = new this.leftClass().width;
         this.§_-Py§ = new this.rightClass().width;
         this.§_-72Y§ = new §_-f1u§(new this.leftClass());
         this.§_-j2g§ = new §_-f1u§(new this.rightClass());
         this.§_-72Y§.loop = true;
         this.§_-72Y§.play();
         this.§_-j2g§.loop = true;
         this.§_-j2g§.play();
         this.§_-f2Y§.§_-J2J§(this.§_-N2D§);
         this.§_-f2Y§.§_-J2J§(this.§_-72Y§);
         this.§_-f2Y§.§_-J2J§(this.§_-j2g§);
         this.§_-j2g§.x = 0;
         §_-J2J§(this.§_-f2Y§);
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
            this.body = param1.CreateBody(§_-41z§);
            this.body.SetUserData(this);
            _loc2_ = b2PolygonShape.AsOrientedBox(this.§_-f2Y§.width * 0.5 / Game.§_-12A§,§_-i2u§ * 0.5 / Game.§_-12A§,new b2Vec2(this.§_-f2Y§.width * 0.5 / Game.§_-12A§,§_-i2u§ * 0.5 / Game.§_-12A§));
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
         param2 = this.§_-a20§;
         param1 = Math.max(int(param1 / this.§_-a2S§) * this.§_-a2S§,this.§_-J1Q§ + this.§_-Py§);
         super.resize(param1,param2);
      }
      
      override protected function draw() : void
      {
         var _loc3_:§_-f1u§ = null;
         while(this.§_-56§.numChildren > 0)
         {
            this.§_-56§.§_-kD§(0).stop();
            this.§_-56§.§_-kD§(0).removeFromParent(true);
            this.§_-56§.§_-av§(0);
         }
         while(this.§_-N2D§.numChildren > 0)
         {
            this.§_-N2D§.§_-av§(0,true);
         }
         var _loc1_:int = Math.ceil((this._width - this.§_-J1Q§) / this.§_-a2S§) - 1;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = new §_-f1u§(new this.middleClass());
            _loc3_.loop = true;
            _loc3_.play();
            _loc3_.x = _loc2_ * this.§_-a2S§;
            this.§_-56§.§_-J2J§(_loc3_);
            _loc2_++;
         }
         this.§_-56§.x = this.§_-J1Q§;
         if(Boolean(this.§_-56§.width) && Boolean(this.§_-56§.height))
         {
            this.§_-N2D§.§_-J2J§(this.§_-56§);
         }
         this.§_-j2g§.x = this.§_-56§.x + this.§_-56§.width;
         this.§_-uz§();
      }
      
      protected function §_-uz§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-f2Y§.numChildren)
         {
            if(this.§_-f2Y§.§_-kD§(_loc1_) is InteractiveObject)
            {
               (this.§_-f2Y§.§_-kD§(_loc1_) as InteractiveObject).doubleClickEnabled = true;
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
      
      protected function get §_-a20§() : Number
      {
         return §_-i2u§;
      }
   }
}

