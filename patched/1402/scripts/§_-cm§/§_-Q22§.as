package §_-cm§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-I1j§;
   import §_-8Q§.§_-O1Y§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-t20§;
   import §_-g16§.§_-I2§;
   import §_-j2H§.§_-H18§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-CD§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-Q22§ extends §_-53A§
   {
      
      public function §_-Q22§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-538§(param1:int, param2:int = -1) : Boolean
      {
         return §_-FS§(§_-Y2n§) && §_-FS§(§_-Jb§) && §_-FS§(§_-I2§);
      }
      
      override public function §_-h2S§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-b2s§;
      }
      
      override public function §_-42C§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-o2§;
      }
      
      override public function §_-vd§(param1:int, param2:int = -1) : Boolean
      {
         return §_-FS§(§_-O2k§) || §_-FS§(§_-t20§) || §_-FS§(§_-I1j§) || §_-FS§(§_-O1Y§) || §_-FS§(§_-H18§);
      }
      
      override protected function §_-GX§() : Array
      {
         return [];
      }
      
      override public function §_-13U§() : int
      {
         return super.§_-13U§() + get(§_-Y2n§).length + get(§_-Jb§).length;
      }
      
      public function §_-42e§(param1:Class) : Vector.<b2Vec2>
      {
         var _loc4_:§_-xn§ = null;
         var _loc2_:Array = get(param1);
         var _loc3_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(_loc4_.position);
         }
         return _loc3_;
      }
      
      public function get §_-839§() : Vector.<b2Vec2>
      {
         return this.§_-42e§(§_-Y2n§);
      }
      
      public function get §_-nM§() : Vector.<b2Vec2>
      {
         return this.§_-42e§(§_-Jb§);
      }
   }
}

